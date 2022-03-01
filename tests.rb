require './person'
require './student'
require './teacher'
require './corrector'

def test(val, ans)
  return 'Success' if val == ans

  "***Failure: Expected #{ans} but got #{val}"
end

p 'BEGIN PERSON TEST'
p "1: #{test(Person.new(18).can_use_services?, true)}"
p "2: #{test(Person.new(14).can_use_services?, true)}"
john = Person.new(14, 'john', parent_permission: false)
p "3: #{test(john.name, 'john')}"
p "4: #{test(john.age, 14)}"
p "5: #{test(john.can_use_services?, false)}"
p "6: #{test(john.name = 'jane', 'jane')}"
p "7: #{test(john.age = 19, 19)}"
p "8: #{test(john.can_use_services?, true)}"
p 'END PERSON TEST'
puts
p 'BEGIN CORRECTOR TEST'
p "1: #{test(Corrector.new.correct_name('12345678901234567890'), '1234567890')}"
p "2: #{test(Corrector.new.correct_name('supercalafragalistic'), 'Supercalaf')}"
p "3: #{test(john.validate_name, 'Jane')}"
p "4: #{test(Person.new(14, 'supercalafragalistic').validate_name, 'Supercalaf')}"
p 'END CORRECTOR TEST'
puts
p 'BEGIN TEACHER TEST'
p "1: #{test(Teacher.new('Maths', 14, 'john', parent_permission: false).can_use_services?, true)}"
p "2: #{test(Teacher.new('Maths', 14, 'john', parent_permission: false).name, 'john')}"
p "3: #{test(Teacher.new('Maths', 14).can_use_services?, true)}"
p 'END TEACHER TEST'
puts
p 'BEGIN STUDENT TEST'
p "1: #{test(Student.new('class1A', 18, 'john', parent_permission: false).can_use_services?, true)}"
p "2: #{test(Student.new('class1A', 14, 'john', parent_permission: false).can_use_services?, false)}"
p "3: #{test(Student.new('class1A', 14).can_use_services?, true)}"
p "4: #{test(Student.new('class1A', 14, 'john').name, 'john')}"
p "5: #{test(Student.new('class1A', 14, 'john').name = 'jane', 'jane')}"
p "6: #{test(Student.new('class1A', 14).play_hooky, '¯(ツ)/¯')}"
p "7: #{test(Student.new('class1A', 14, 'john').age, 14)}"
p "8: #{test(Student.new('class1A', 14, 'john').age = 19, 19)}"
p 'END STUDENT TEST'
