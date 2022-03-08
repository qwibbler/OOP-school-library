require './student'
require './teacher'
require './wrong_option'

class CreatePerson
  def make_person
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp

    [age, name]
  end
end

class CreateStudent < CreatePerson
  def create_student
    arr = make_person
    print 'Has Parent Permission? [Y/N]: '
    pp = gets.chomp
    return WrongOption.new.print_message unless %w[y n].include? pp.downcase

    puts 'Student created successfully'
    Student.new('', arr[0], arr[1], parent_permission: pp.downcase == 'y')
  end
end

class CreateTeacher < CreatePerson
  def create_teacher
    arr = make_person
    print 'Specialization: '
    spec = gets.chomp
    puts 'Teacher created successfully'
    Teacher.new(spec, arr[0], arr[1])
  end
end
