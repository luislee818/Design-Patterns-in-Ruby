require 'singleton'

class SimpleLogger
  include Singleton

  def initialize
    @counter = 0
  end

  def increment
    @counter = @counter + 1
  end

  def get_value
    return @counter
  end
end

puts SimpleLogger.instance.get_value
SimpleLogger.instance.increment
SimpleLogger.instance.increment
puts SimpleLogger.instance.get_value
