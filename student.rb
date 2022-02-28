require './person.rb'
class Student < Person
  def initialize(classroom, age, name = 'Unknown', parent_permission: true)
    super(age, name, parent_permission: true)
    @classroom = classroom
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end

# Student tests
print Student.new('class1A', 14, 'hi', parent_permission: false).can_use_services?, ' = ', false
puts
print Student.new('class1A', 14, 'hi', parent_permission: false).name
puts
print Student.new('class1A', 14).can_use_services?, ' = ', true
puts
print Student.new('class1A', 14).play_hooky
