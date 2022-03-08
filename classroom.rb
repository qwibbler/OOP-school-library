class Classroom
  attr_accessor :label
  attr_reader :students

  def initialize(label)
    @label = label
    @students = []
  end

  def add_student=(student)
    @students << student unless @students.include?(student)
    student.change_classroom = self unless student.classroom == self
  end
end
