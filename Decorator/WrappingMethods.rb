require_relative 'Component'

component = Component.new

class << component
  alias old_write_line write_line

  def write_line(line)
    old_write_line(line.upcase)
  end
end

component.write_line("things are going")
component.write_line("really, really well")
