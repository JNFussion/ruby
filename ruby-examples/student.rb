class Student
  def initialize(name, grade)
    @name = name
    @grade = grade
  end

  def better_grade_than?(other)
    grade > other.grade
  end

  protected

  attr_reader :grade
end

joe = Student.new('joe', 10)
bob = Student.new('bob', 6)

puts 'well done!' if joe.better_grade_than?(bob)
