require_relative 'lib'

class BritishTextObjectAdapter < TextObject
  def initialize(bto)
    @bto = bto
  end

  def text
    @bto.string
  end

  def size_inches
    @bto.size_mm / 25.4
  end

  def color
    @bto.colour
  end
end

text_object = TextObject.new("Something", 3, "red")
renderer = Renderer.new
renderer.render(text_object)

british_text_object = BritishTextObject.new("Something British", 11, "yellow")
adapter = BritishTextObjectAdapter.new(british_text_object)
renderer.render(adapter)
