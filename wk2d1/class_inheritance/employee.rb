class Employee
  attr_reader :name, :title, :boss, :salary
  def initialize(name, title, boss, salary)
    @name = name
    @title = title
    @boss = boss
    @salary =salary
  end

  def bonus(multiplier)
    @salary * multiplier
  end
end

class Manager < Employee
  attr_reader :employees
  def initialize(name, title, boss, salary)
    super
    @employees = []
  end

  def bonus(multiplier)
    employee_salary = @employees.map {|a| a.salary}.inject(:+)
    employee_salary * multiplier
  end

  def set_employees(*employee)
    employee.each do |e|
      if e.is_a?(Manager)
        if e.employees.length > 0
          e.employees.each {|e| @employees << e}
        end
      end
        @employees << e

    end
  end
end

ned = Manager.new('Ned', 'Founder', nil, 1000000)
darren = Manager.new('Darren', 'TA manager', ned, 78000)


shawna = Employee.new('Shawna', 'TA', darren, 12000)
david = Employee.new('David', 'TA', darren, 10000)
darren.set_employees(shawna, david)
ned.set_employees(darren)

puts ned.bonus(5) # => 500_000
puts darren.bonus(4) # => 88_000
puts david.bonus(3) # => 30_000
