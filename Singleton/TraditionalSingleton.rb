class Singleton
  def initialize
    @counter = 0
  end

  def increment
    @counter = @counter + 1
  end

  def get_value
    return @counter
  end

  def self.instance
    return @@instance
  end

  # place this line after instance member definitions, so the Singleton instance will be 'complete', 
  # if placed at the top of class definition, calling increment will get @counter is nil, 
  # because initialize was not defined when called.
  @@instance = Singleton.new      
  private_class_method :new
end

puts Singleton.instance.get_value
Singleton.instance.increment
Singleton.instance.increment
puts Singleton.instance.get_value
