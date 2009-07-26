require 'rubygems'

module Hook
  @@subclasses = []  
  @@hooks = {}

  # Register subclass that contains response to hooks
  def self.register_subclass(subclass)
    @@subclasses << subclass  
  end

  # Execute hook on all subclasses that responds to it
  def self.execute(hook, caller)
    responses = []
    @@hooks[hook] ||= @@subclasses.select{|subclass| subclass.respond_to?(hook)}
    @@hooks[hook].each{ |m|
      responses << response = m.send(hook, caller)
      yield response if block_given?
    }
    responses
  end

  class Base
    def self.inherited(subclass)
      Hook::register_subclass(subclass)
    end
  end
end
