require_relative '../classroom'

describe Classroom do
  context 'Testing the Classroom class' do
    it 'A new classroom has a label and students' do
      classroom = Classroom.new('Ruby')
      expect(classroom.label).to eq 'Ruby'
    end

    it 'A newly created classroom has students property of type Array' do
      classroom = Classroom.new('Ruby')
      expect(classroom.students).to be_a(Array)
    end
  end
end
