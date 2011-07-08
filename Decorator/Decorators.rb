require_relative 'Component'

class LineNumberDecorator
  def initialize(component)
    @component = component
    @line_number = 1
  end

  def write_line(line)
    @component.write_line("##{@line_number} #{line}")
    @line_number += 1
  end
end

class UppercaseDecorator
  def initialize(component)
    @component = component
  end

  def write_line(line)
    @component.write_line(line.upcase)
  end
end

component = Component.new
decorator = UppercaseDecorator.new(LineNumberDecorator.new(component))
decorator.write_line("things are going")
decorator.write_line("really, really well")
