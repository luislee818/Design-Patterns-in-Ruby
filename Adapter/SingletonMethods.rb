require_relative "lib"

british_text_object = BritishTextObject.new("Something British", 11, "yellow")

#class << british_text_object
#  def text
#    return string
#  end
#
#  def size_inches
#    return size_mm / 25.4
#  end
#
#  def color
#    return colour
#  end
#end

def british_text_object.text
    return string
end

def british_text_object.size_inches
    return size_mm / 25.4
end

def british_text_object.color
    return colour
end

renderer = Renderer.new
renderer.render(british_text_object)
