class Term
  attr_reader :name, :courses

  def initialize(season, year)
    @name = season + ' ' + year.to_s
    @courses = []
  end

  def add_course(course)
    courses << course
  end

  def courses_open
    courses.map do |course|
        course unless course.full?
        # require 'pry'; binding.pry
    end
  end
end
