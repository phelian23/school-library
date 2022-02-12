require_relative '../teacher'

describe Teacher do
  context 'Testing the Teacher class to create a teacher' do
    it ' a teacher is a kind of person' do
      teacher = Teacher.new('specialization', 12, 'name')
      expect(teacher).to be_a(Person)
      expect(teacher.name).to eq('name')
    end
  end
end
