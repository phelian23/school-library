require_relative 'corrector'

class Person
  attr_reader :id, :corrector
  attr_accessor :name, :age, :parent_permission

  def initialize(age, name = 'unknown', parent_permission: true)
    @id = rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @corrector = Corrector.new
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def validate_name
    @name = @corrector.correct_name(@name)
  end

  private

  def of_age?
    @age >= 18
  end
end
