class MultiTasker
  def initialize(tasks)
    @tasks = tasks
  end

  def for_each_task
    index = 0
    while index < @tasks.length
      yield(@tasks[index])
      index += 1
    end
  end
end

tasks = ['Eat', 'Drink', 'Sleep']
me = MultiTasker.new(tasks)

me.for_each_task { |task| puts(task) }
