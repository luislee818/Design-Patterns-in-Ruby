class Renderer
  def render(text_object)
    text = text_object.text
    size = text_object.size_inches
    color = text_object.color

    puts("Text: #{text}, size: #{size} inches, color: #{color}")
  end
end

class TextObject
  attr_reader :text, :size_inches, :color

  def initialize(text, size, color)
    @text = text
    @size_inches = size
    @color = color 
  end
end

class BritishTextObject
  attr_reader :string, :size_mm, :colour

  def initialize(string, size_mm, colour)
    @string = string
    @size_mm = size_mm
    @colour = colour 
  end
end
