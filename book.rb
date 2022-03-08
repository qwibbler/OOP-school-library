require './rental'
class Book
  attr_accessor :title, :author, :rents

  def initialize(title, author)
    @title = title
    @author = author
    @rents = []
  end

  def add_rental(date, person)
    Rental.new(self, person, date)
  end
end
