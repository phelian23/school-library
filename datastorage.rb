require 'json'
require_relative 'person'
require_relative 'options'
require_relative 'rental'
require_relative 'book'

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
      data << if person.instance_of?(Teacher)
                { key: 'teacher', id: person.id, age: person.age, name: person.name,
                  specialization: person.specialization }
              else
                { key: 'student', id: person.id, age: person.age, name: person.name,
                  parent_permission: person.parent_permission, classroom: person.classroom }
              end
      save_data('person.json', data)
    end
  end

  def save_rentals
    data = []
    @rentals.each do |rental|
      data << ({ date: rental.date, book: rental.book.title, person: rental.person.id })
      save_data('rental.json', data)
    end
  end

  def save_books
    data = []
    @books.each do |book|
      data << ({ title: book.title, author: book.author })
      save_data('books.json', data)
    end
  end

  def load_people
    filename = 'person.json'
    if File.exist? filename
      data = load_data(filename)
      data.each do |person|
        if person['key'] == 'Teacher'
          Teacher.new(specialization: person['specialization'], age: person['age'], name: person['name'])
        else
          Student.new(classroom: person['classroom'], age: person[age], name: person['name'],
                      parent_permission: person['parent_permission'])
        end
      end
    else
      []
    end
  end
end
