require 'json'

module DataStorage
  def save_data(filename, data)
    File.open(filename, 'w') do |file|
      file.puts data.to_json
    end
  end

  def load_data(filename)
    JSON.parse(File.read(filename))
  end

  def save_person
    data = []
    @people.each do |person|
      if person.instance_of?(Teacher)
        data << ({key: 'teacher', id: person.id, age: person.age, name: person.name, specialization: person.specialization})
      else
        data << ({key: 'student', id: person.id, age: person.age, name: person.name, parent_permission: person.parent_permission, classroom: person.classroom})
      end
      save_data('person.json', data)
    end
  end
  
  def save_rentals
    data = [] 
    @rentals.each do |rental|
        data << ({date: rental.date, person: rental.person.id, book: rental.book.id})
      save_data('rental.json', data)
  end
  
  def save_books
    data = []
    @books.each do |book|
        data << ({title: book.title, author: book.author})
      save_data('books.json', data)
  end
end