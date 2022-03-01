require './person'
class Student < Person
  def initialize(classroom, *args, **kwargs)
    super(*args, **kwargs)
    @classroom = classroom
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end

# Student tests
puts 'BEGIN STUDENT TEST'
print Student.new('class1A', 18, 'john', parent_permission: false).can_use_services?, ' = ', true
puts
print Student.new('class1A', 14, 'john', parent_permission: false).can_use_services?, ' = ', false
puts
print Student.new('class1A', 14).can_use_services?, ' = ', true
puts
print Student.new('class1A', 14, 'john').name, ' = john'
puts
print Student.new('class1A', 14, 'john').name = 'jane', ' = jane'
puts
print Student.new('class1A', 14).play_hooky
puts
print Student.new('class1A', 14, 'john').age, ' = 14'
puts
print Student.new('class1A', 14, 'john').age = 19, ' = 19'
puts
puts 'END STUDENT TEST'
