namespace :backfill do

  desc 'Backfills domain entries from records'
  task :domains => :environment do
  
      existing_domains = Domain.all.map(&:id)
      Record.find_all_by_type('SOA').each do |r| 
        next if existing_domains.include?(r.domain_id)
        puts "adding #{r.name}"
        domain = Domain.new(:id => r.domain_id, :name => r.name, :ttl => 86400, :type => 'NATIVE')
        domain.save(false)
        existing_domains << r.domain_id
      end

  end

end
