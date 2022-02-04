require_relative 'corrector'
require_relative 'rental'

class Person
  attr_reader :id, :corrector
  attr_accessor :name, :age, :parent_permission, :rentals

  def initialize(age, name = 'unknown', rentals = [], parent_permission: true)
    @id = rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @corrector = Corrector.new
    @rentals = rentals
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def validate_name
    @name = @corrector.correct_name(@name)
  end

  def add_rental(date, book)
    Rental.new(date, book, self)
  end

  private

  def of_age?
    @age >= 18
  end
end
