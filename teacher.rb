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
