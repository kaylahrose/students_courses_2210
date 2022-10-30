class Term
  attr_reader :name, :courses

  def initialize(season, year)
    @name = season + ' ' + year.to_s
    @courses = []
  end

  def add_course(course)
    courses << course
  end

  def enroll(student, enrolling_course)
    courses.find do |course|
      enrolling_course == course
    end.enroll(student)
  end

  def courses_open
    courses.map do |course|
      course unless course.full?
      # require 'pry'; binding.pry
    end.compact
  end

  def roster
    courses.flat_map do |course|
      course.students.map do |student|
        student.name
      end
    end
  end
end
