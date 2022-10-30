require './lib/course'
require './lib/student'
require './lib/term'

RSpec.describe Term do
  # You have been contracted by the University of Denver to write a
  #  program that can track terms. Specifically, they would like
  # you to implement the following functionality:

  # Each term has a name, like "Winter 2018" as well as a way
  # to read that data
  it 'exists' do
    term = Term.new('Winter', 2018)
    expect(term).to be_instance_of(Term)
    expect(term.name).to eq('Winter 2018')
    expect(term.courses).to eq([])
  end

  it 'has a list of multiple courses' do
    term = Term.new('Winter', 2018)
    course1 = Course.new('Calculus', 2)
    term.add_course(course1)
    expect(term.courses).to eq([course1])
  end

  it 'list all courses that are open' do
    term = Term.new('Winter', 2018)
    course1 = Course.new('Calculus', 2)
    term.add_course(course1)
    course2 = Course.new('Chemistry', 4)
    term.add_course(course2)
    expect(term.courses_open).to eq([course1, course2])

    #  A course is open if it has fewer students than its capacity.
  end
  # A term can list all student names across all courses.
  # Build upon your code from the first two iterations to complete this task.
end
