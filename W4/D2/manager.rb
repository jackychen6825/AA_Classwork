require_relative "employee"

class Manager < Employee
  attr_reader :employees

  def initialize(name, title, salary, boss, employees)
    super(name, title, salary, boss)
    @employees = employees
  end

  def bonus(multiplier)
    total_salary = 0
    queue = employees
    until queue.empty?
      total_salary += queue[0].salary
      if queue[0].is_a?(Manager)
        queue += queue.shift.employees
      else
        queue.shift
      end 
    end 
    total_salary * multiplier
  end

end

david = Employee.new("david", "TA", 10000, "darren")
shawna = Employee.new("shawna", "TA", 12000, "darren")
darren = Manager.new("darren", "manager", 78000, "ned", [shawna, david])
ned = Manager.new("ned", "founder", 1000000, nil, [darren])


puts ned.bonus(5) # => 500_000
puts darren.bonus(4) # => 88_000
puts david.bonus(3) # => 30_000