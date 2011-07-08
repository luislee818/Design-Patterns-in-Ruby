require_relative 'Component'

module TimeStampWriter
  def write_line(line)
    super("Time #{Time.new}: #{line}")
  end
end

module UppercaseWriter
  def write_line(line)
    super(line.upcase)
  end
end

component = Component.new
component.extend(UppercaseWriter)
component.extend(TimeStampWriter)

component.write_line("hello")
