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
    term = Term.new("winter", 2018)
    expect(term).to be_instance_of(Term)
    expect(term.name).to eq("Winter 2018")
end
# Each term has a list of multiple courses
# A term can list all courses that are open. A course is open if it has fewer students than its capacity.
# A term can list all student names across all courses.
# Build upon your code from the first two iterations to complete this task.
end