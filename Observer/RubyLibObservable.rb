require 'observer'

class Employee
  include Observable    # observable module in Ruby lib
  attr_reader :name
  attr_accessor :title, :salary

  def initialize (name, title, salary)
    super()
    @name = name
    @title = title
    @salary = salary
    @observers = []
  end

  def salary= (new_salary)
    old_salary = @salary
    @salary = new_salary

    if old_salary != new_salary
      changed    # need to call changed
      notify_observers(self)
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
