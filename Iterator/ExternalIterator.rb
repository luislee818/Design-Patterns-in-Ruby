class ArrayIterator
  def initialize(array)
    @array = array
    @index = 0
  end

  def has_next?
    @index < @array.length 
  end

  def item
    @array[@index]
  end

  def next_item
    value = @array[@index]
    @index += 1
    value
  end
end

array = ['R', 'G', 'B']
iterator = ArrayIterator.new(array)

while iterator.has_next?
  puts(iterator.next_item)
end
