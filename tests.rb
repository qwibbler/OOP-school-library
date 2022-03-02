require './person'
require './student'
require './teacher'
require './corrector'
require './classroom'
require './book'
require './rental'

def test(val, ans)
  return 'Success' if val == ans

  "***Failure: Expected #{ans} but got #{val}"
end

john = Person.new(14, 'john', parent_permission: false)
# p 'BEGIN PERSON TEST'
# p "1: #{test(Person.new(18).can_use_services?, true)}"
# p "2: #{test(Person.new(14).can_use_services?, true)}"
# p "3: #{test(john.name, 'john')}"
# p "4: #{test(john.age, 14)}"
# p "5: #{test(john.can_use_services?, false)}"
# p "6: #{test(john.name = 'jane', 'jane')}"
# p "7: #{test(john.age = 19, 19)}"
# p "8: #{test(john.can_use_services?, true)}"
# p 'END PERSON TEST'
# puts
# p 'BEGIN CORRECTOR TEST'
# p "1: #{test(Corrector.new.correct_name('12345678901234567890'), '1234567890')}"
# p "2: #{test(Corrector.new.correct_name('supercalafragalistic'), 'Supercalaf')}"
# p "3: #{test(john.validate_name, 'Jane')}"
# p "4: #{test(Person.new(14, 'supercalafragalistic').validate_name, 'Supercalaf')}"
# p 'END CORRECTOR TEST'
# puts
# p 'BEGIN TEACHER TEST'
# p "1: #{test(Teacher.new('Maths', 14, 'john', parent_permission: false).can_use_services?, true)}"
# p "2: #{test(Teacher.new('Maths', 14, 'john', parent_permission: false).name, 'john')}"
# p "3: #{test(Teacher.new('Maths', 14).can_use_services?, true)}"
# p 'END TEACHER TEST'
# puts
class1a = Classroom.new('class1A')
p 'BEGIN STUDENT TEST'
p "1: #{test(Student.new(class1a, 18, 'john', parent_permission: false).can_use_services?, true)}"
p "2: #{test(Student.new(class1a, 14, 'john', parent_permission: false).can_use_services?, false)}"
p "3: #{test(Student.new(class1a, 14).can_use_services?, true)}"
p "4: #{test(Student.new(class1a, 14, 'john').name, 'john')}"
p "5: #{test(Student.new(class1a, 14, 'john').name = 'jane', 'jane')}"
p "6: #{test(Student.new(class1a, 14).play_hooky, '¯(ツ)/¯')}"
p "7: #{test(Student.new(class1a, 14, 'john').age, 14)}"
p "8: #{test(Student.new(class1a, 14, 'john').age = 19, 19)}"
p 'END STUDENT TEST'
puts
class2a = Classroom.new('class2A')
p 'BEGIN CLASSROOM TEST'
p "1: #{test(class2a.label, 'class2A')}"
class2a.add_student = Student.new('class1A', 14, 'john')
class2a.add_student = Student.new('class1A', 14, 'jane')
puts
p jane = Student.new(class2a, 14, 'jane')
p jane.change_classroom = class1a
p jane
puts
p 'END CLASSROOM TEST'
puts
book = Book.new('title', 'author')
p 'BEGIN RENT BOOKS TEST'
rent = Rental.new('now', book, john)
p "1: #{test(rent.date, 'now')}"
puts
p rent.book
p rent.person
puts
p 'END RENT BOOKS TEST'
puts
