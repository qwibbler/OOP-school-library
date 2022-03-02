require './person'
class Student < Person
  def initialize(classroom, *args, **kwargs)
    super(*args, **kwargs)
    @classroom = classroom
  end

  def play_hooky
    "¯\(ツ)/¯"
  end

  def change_classroom(label)
    @classroom = label
  end
end
