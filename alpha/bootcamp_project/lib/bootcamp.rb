class Bootcamp
    attr_reader :name, :slogan, :students, :teachers
  def initialize(name, slogan, student_capacity)
    @name, @slogan, @student_capacity = name, slogan, student_capacity
    @students, @teachers = [], []
    @grades = Hash.new { |h, k| h[k] = [] }
  end

  def hire(teacher)
    teachers << teacher
  end

  def enroll(student)
    if students.length < @student_capacity
        students << student
        return true
    end
    false
  end

  def enrolled?(student)
    students.include?(student)
  end

  def student_to_teacher_ratio
    students.length / teachers.length
  end

  def add_grade(student, grade)
    if enrolled?(student)
        @grades[student] << grade
        return true
    end
    false
  end

  def num_grades(student)
    @grades[student].length
  end

  def average_grade(student)
    grades = @grades[student]
    return nil if grades.empty? || !enrolled?(student)
    grades.sum / num_grades(student)
  end
end
