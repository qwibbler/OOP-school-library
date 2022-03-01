require './person'
class Teacher < Person
  def initialize(specialization, *args, **kwargs)
    super(*args, **kwargs)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end

puts 'BEGIN TEACHER TEST'
print Teacher.new('Maths', 14)
puts
print Teacher.new('Maths', 14, 'john', parent_permission: false).can_use_services?, ' = ', true
puts
print Teacher.new('Maths', 14, 'john', parent_permission: false).name, ' = john'
puts
print Teacher.new('Maths', 14).can_use_services?, ' = ', true
puts
puts 'END TEACHER TEST'
