class Course
  attr_reader :name, :capacity, :students

  def initialize(name, capacity)
    @name = name
    @capacity = capacity
    @students = []
  end

  def full?
    
    students.length == capacity
    
  end

  def enroll(student)
    students << student
  end
end
