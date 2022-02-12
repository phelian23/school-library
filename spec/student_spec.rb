require_relative '../student'
require_relative '../classroom'

describe Student do
  context 'Testing the Student class to create a student' do
    it ' a student is a kind of person' do
      classroom = Classroom.new('Chemistry')
      student = Student.new(classroom, 12,'name')
      expect(student).to be_a(Person)
      expect(student.classroom).to be_a(Classroom)
    end
  end
end