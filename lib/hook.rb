require 'rubygems'
require 'yaml'

module Hook
  @@hooks = {}
  @@config = nil
  @@subclasses = nil
  
  # Execute hook on all registered subclasses
  def self.execute(hook, caller)

    @@hooks[hook] ||= self.subclasses.select{|subclass| subclass.respond_to?(hook)}
    
    responses = []
    @@hooks[hook].each{ |m|
      responses << response = m.send(hook, caller)
      yield response if block_given?
    }
    responses
  end
  
  # Find configurated subclasses that aren't disabled
  def self.subclasses
    @@subclasses ||= self.config.map do |subclass, config|
      subclass.classify.constantize unless config["enabled"] == false
    end
  end
  
  # Read config
  def self.config
    begin
      @@config ||= YAML.load_file("#{RAILS_ROOT}/config/hooks.yml")
    rescue
      @@config = {}
    end
  end
  
  def self.config_for(subclass)
    self.config[subclass] || {}
  end
end
