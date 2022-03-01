require './person'
require './student'
require './teacher'
require './corrector'

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
puts 'BEGIN CORRECTOR TEST'
print Corrector.new.correct_name('12345678901234567890'), ' = 1234567890'
puts
print Corrector.new.correct_name('supercalafragalistic'), ' = Supercalaf'
puts
print john.validate_name, ' = Jane'
puts
print Person.new(14, 'supercalafragalistic').validate_name, ' = Supercalaf'
puts
puts 'END PERSON TEST'
puts
puts 'BEGIN TEACHER TEST'
print Teacher.new('Maths', 14, 'john', parent_permission: false).can_use_services?, ' = ', true
puts
print Teacher.new('Maths', 14, 'john', parent_permission: false).name, ' = john'
puts
print Teacher.new('Maths', 14).can_use_services?, ' = ', true
puts
puts 'END TEACHER TEST'
puts
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
