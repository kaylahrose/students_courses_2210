require './lib/course'
require './lib/student'
require './lib/term'

RSpec.describe Term do
  let(:term) { Term.new('Winter 2018') }
  it 'exists' do
    expect(term).to be_instance_of(Term)
    expect(term.name).to eq('Winter 2018')
    expect(term.courses).to eq([])
  end

  it 'has a list of multiple courses' do
    course1 = Course.new('Calculus', 2)
    term.add_course(course1)

    expect(term.courses).to eq([course1])
  end

  it 'list all courses that are open' do
    course1 = Course.new('Calculus', 2)
    term.add_course(course1)
    course2 = Course.new('Chemistry', 4)
    term.add_course(course2)

    expect(term.courses_open).to eq([course1, course2])

    student1 = Student.new({ name: 'Morgan', age: 21 })
    student2 = Student.new({ name: 'Jordan', age: 29 })
    term.courses[0].enroll(student1)
    term.courses[0].enroll(student2)

    expect(term.courses_open).to eq([course2])
  end

  it 'enrolls students' do
    course1 = Course.new('Calculus', 2)
    term.add_course(course1)
    course2 = Course.new('Chemistry', 4)
    term.add_course(course2)

    expect(term.courses_open).to eq([course1, course2])

    student1 = Student.new({ name: 'Morgan', age: 21 })
    student2 = Student.new({ name: 'Jordan', age: 29 })
    term.enroll(student1, course1)
    term.enroll(student2, course1)

    expect(term.courses_open).to eq([course2])
  end

  it 'lists all student names across all courses' do
    course1 = Course.new('Calculus', 2)
    term.add_course(course1)
    course2 = Course.new('Chemistry', 4)
    term.add_course(course2)
    student1 = Student.new({ name: 'Morgan', age: 21 })
    student2 = Student.new({ name: 'Jordan', age: 29 })
    term.courses[0].enroll(student1)
    term.courses[0].enroll(student2)
    student3 = Student.new({ name: 'Jessica', age: 21 })
    student4 = Student.new({ name: 'Penny', age: 29 })
    term.courses[1].enroll(student3)
    term.courses[1].enroll(student4)

    expect(term.roster).to eq(%w[Morgan Jordan Jessica Penny])
  end
end
