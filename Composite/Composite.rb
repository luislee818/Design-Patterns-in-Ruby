class Task
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def get_total_time
    raise 'Not Implemented'
  end
end

class CompositeTask < Task
  def initialize(name)
    super(name)
    @tasks = []
  end

  def add_task(task)
    @tasks << task
  end

  def remove_task(task)
    @tasks.remove(task)
  end

  def get_total_time
    total = 0
    @tasks.each { |task| total += task.get_total_time }
    total
  end
end

class ReadChapterOne < Task
  def get_total_time
    1.5
  end
end 

#class ReadChapterTwo < Task
#  def get_total_time
#    2
#  end
#end 

class ReadChapterTwoListOne < Task
  def get_total_time
    1.5
  end
end 
class ReadChapterTwoListTwo < Task
  def get_total_time
    2.5
  end
end 

class ReadChapterThree < Task
  def get_total_time
    3.5
  end
end 

readChapOne = ReadChapterOne.new('ChapOne')
readChapTwo = CompositeTask.new('ChapTwo')
readChapTwoListOne = ReadChapterTwoListOne.new('ChapTwoListOne')
readChapTwoListTwo = ReadChapterTwoListTwo.new('ChapTwoListTwo')
readChapTwo.add_task(readChapTwoListOne)
readChapTwo.add_task(readChapTwoListTwo)
readChapThree = ReadChapterThree.new('ChapThree')

readSectionOne = CompositeTask.new('SectionOne')
readSectionOne.add_task(readChapOne)
readSectionOne.add_task(readChapTwo)

readSectionTwo = CompositeTask.new('SectionTwo')
readSectionTwo.add_task(readChapThree)

readBook = CompositeTask.new('Book')
readBook.add_task(readSectionOne)
readBook.add_task(readSectionTwo)
puts("Total time for reading the whole book is #{readBook.get_total_time}")
