class Classroom
  attr_accessor :label

  def initialize(label)
    @label = label
    @students = []
  end

  def add_student=(student)
    students << student unless @students.include?(student)
    student.change_classroom(@label)
  end
end
