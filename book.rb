require './rental'

class Book
  attr_accessor :title, :author, :rents
  attr_reader :id

  def initialize(title, author)
    @title = title
    @author = author
    @rents = []
    @id = Random.rand(1..1000)
  end

  def add_rental(date, person)
    Rental.new(self, person, date)
  end
end
