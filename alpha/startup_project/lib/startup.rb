require "employee"

class Startup
    attr_reader :name, :funding, :salaries, :employees
    def initialize(name, funding, salaries)
        @name, @funding, @salaries = name, funding, salaries
        @employees = []
    end

    def valid_title?(title)
        salaries.has_key?(title)
    end

    def >(other_startup)
        funding > other_startup.funding
    end

    def hire(employee_name, title)
        raise "invalid title" unless valid_title?(title)
        new_employee = Employee.new(employee_name, title)
        employees << new_employee
    end

    def size
        employees.size
    end

    def pay_employee(employee)
        employee_salary = salaries[employee.title]
        if funding >= employee_salary
            employee.pay(employee_salary)
            @funding -= employee_salary
        else
            raise "insufficient funds"
        end
    end

    def payday
        employees.each { |employee| pay_employee(employee) }
    end

    def average_salary
        total_salaries = employees.reduce(0) do |total, employee|
            employee_salary = salaries[employee.title]
            total + employee_salary
        end
        total_salaries / size
    end

    def close
        @employees = []
        @funding = 0
    end

    def acquire(other_startup)
        @funding += other_startup.funding
        @salaries = other_startup.salaries.merge(@salaries)
        @employees.concat(other_startup.employees)
        other_startup.close
    end
end
