module Subject
  def initialize
    @observers = []
  end

  def add_observer(observer)
    @observers << observer 
  end
  def add_observer(&observer)
    @observers << observer 
  end

  def delete_observer(observer)
    @observers.delete(observer)
  end

  def notify_observers
    @observers.each do |observer|
      observer.update(self)
    end
  end
end

class Employee
  include Subject
  attr_reader :name
  attr_accessor :title, :salary

  def initialize (name, title, salary)
    super()
    @name = name
    @title = title
    @salary = salary
  end

  def salary= (new_salary)
    old_salary = @salary
    @salary = new_salary

    if old_salary != new_salary
      notify_observers
    end
  end
end

class Payroll
  def update(employee)
    puts("#{employee.name}'s salary just changed to #{employee.salary}")
  end
end

class TaxMan
  def update(employee)
    puts("#{employee.name}'s salary just changed, send him a tax bill!")
  end
end

john = Employee.new('John Doe', 'Programmer', 1000)
john.add_observer(Payroll.new)
john.add_observer(TaxMan.new)
john.salary = 1500
