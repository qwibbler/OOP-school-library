class Person
  attr_accessor :name, :age
  attr_reader :id

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

# Person tests
puts 'BEGIN PERSON TEST'
print Person.new(18).can_use_services?, ' = ', true
puts
print Person.new(14).can_use_services?, ' = ', true
puts
john = Person.new(14, 'john', parent_permission: false)
print john.name, ' = john'
puts
print john.age, ' = 14'
puts
print john.can_use_services?, ' = ', false
puts
print john.name = 'jane', ' = jane'
puts
print john.age = 19, ' = 19'
puts
print john.can_use_services?, ' = ', true
puts
puts 'END PERSON TEST'
puts
