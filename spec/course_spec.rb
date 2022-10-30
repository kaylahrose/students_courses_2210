require './lib/course'
require './lib/student'

RSpec.describe Course do
  let(:course) { Course.new('Calculus', 2) }

  it 'exists and has attributes' do
    expect(course.name).to eq('Calculus')
    expect(course.capacity).to eq(2)
    expect(course.students).to eq([])
  end

  it 'returns if full' do
    expect(course.full?).to eq(false)
  end

  it 'enrolls students' do
    student1 = Student.new({ name: 'Morgan', age: 21 })
    student2 = Student.new({ name: 'Jordan', age: 29 })
    course.enroll(student1)
    course.enroll(student2)
    expect(course.full?).to eq(true)
    expect(course.students).to eq([student1, student2])
  end

  it 'charges student account' do
    student1 = Student.new({ name: 'Morgan', age: 21 })
    course.enroll(student1)
    expect(student1.account).to eq(1)
    course2 = Course.new('Chemistry', 4)
    course2.enroll(student1)
    expect(student1.account).to eq(2)
  end
end
