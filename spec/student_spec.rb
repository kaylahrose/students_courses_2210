require './lib/student'

RSpec.describe Student do
  let(:student) { Student.new({ name: 'Morgan', age: 21 }) }

  it 'exists and has attributes' do
    expect(student.name).to eq('Morgan')
    expect(student.age).to eq(21)
    expect(student.scores).to eq([])
    expect(student.account).to eq(0)
  end

  it 'logs scores' do
    student.log_score(89)
    student.log_score(78)
    expect(student.scores).to eq([89, 78])
  end

  it 'calculates average grade' do
    student.log_score(89)
    student.log_score(78)
    expect(student.grade).to eq(83.5)
  end

  it 'charges account' do
    student.charge
    expect(student.account).to eq(1)
  end
end
