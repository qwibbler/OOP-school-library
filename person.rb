require './corrector'
require './rental'
class Person
  attr_accessor :name, :age, :rents
  attr_reader :id

  def initialize(age, name = 'Unknown', parent_permission: true)
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @corrector = Corrector.new
    @rents = []
  end

  def can_use_services?
    return false unless of_age? || @parent_permission

    true
  end

  def validate_name
    @name = @corrector.correct_name(@name)
  end

  def add_rental(date, book)
    Rental.new(book, self, date)
  end

  private

  def of_age?
    return true if @age >= 18

    false
  end
end
