require './person'
class Student < Person
  attr_reader :classroom

  def initialize(classroom, *args, **kwargs)
    super(*args, **kwargs)
    @classroom = classroom
  end

  def play_hooky
    "¯\(ツ)/¯"
  end

  def change_classroom=(classroom)
    @classroom = classroom
    classroom.add_student = self
  end
end
