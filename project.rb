class Person
  attr_reader :id, :name

  def initialize(age, name = 'Unknown', parent_permission: true)
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def can_use_services?
    return false unless is_of_age? || @parent_permission

    true
  end

  private

  def is_of_age?
    return true if @age >= 18

    false
  end
end

john = Person.new(18)
p john.can_use_services?
john = Person.new(14)
p john.can_use_services?
john = Person.new(14, 'hi', parent_permission: false)
p john.can_use_services?
