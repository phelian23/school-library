require_relative '../person'

describe Person do
  context 'Testing the Person class to create a person' do
    it 'creating a person with only the age parameter set the name parameter to unknown' do
      person = Person.new(15)
      expect(person.name).to eq('unknown')
      expect(person.age).to eq(15)
    end

    it 'Creating a person without the parent_permission set the default permission to true' do
      person = Person.new(34, 'Munsa Femi')
      expect(person.parent_permission).to eq('true')
    end
  end
end
