require_relative "lib"

class BritishTextObject
  def text
    return string
  end

  def size_inches
    return size_mm / 25.4
  end

  def color
    return colour
  end
end

british_text_object = BritishTextObject.new("Something British", 11, "yellow")
renderer = Renderer.new
renderer.render(british_text_object)
