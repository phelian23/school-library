require_relative '../book'
require_relative '../person'

describe Book do
  context 'Testing the book creates a book and add rentals properly' do
    it 'should create a new book with a title and author' do
      book = Book.new('Things fall apart', 'Chinua Achebe')
      expect(book.title).to be_a(String)
      expect(book.author).to eq 'Chinua Achebe'
    end

    it 'should add a new rental' do
      new_book = Book.new('The Interpreter', 'Wole Soyinka')
      person = Person.new(25)
      new_book.add_rental('2/10/22', person)
      expect(new_book.rentals.length).to eq 1
    end
  end
end
