class MakeAuditsGoAway < ActiveRecord::Migration
  def self.up
    drop_table :audits
  end

  def self.down
    # HAHA! 
    # no.
  end
end
