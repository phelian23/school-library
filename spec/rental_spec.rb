require_relative '../rental'
require_relative '../person'
require_relative '../book'
require_relative '../teacher'

describe Rental do
  context 'Testing the Rental class to create a rental' do
    it 'creating a rental having the date, book and person' do
      teacher = Teacher.new('specialization', 15)
      book = Book.new('title','author')
      rental = Rental.new('12/21/2008', book, teacher)
      expect(rental.date).to eq('12/21/2008')
      expect(rental.book).to be_a(Book)
      expect(rental.person).to be_a(Person)
    end
  end
end
