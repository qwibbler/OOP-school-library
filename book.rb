require './rental'
class Book
  attr_accessor :title, :author, :rents

  def initialize(title, author)
    @title = title
    @author = author
    @rents = []
  end

  def rented(date, person)
    Rental.new(date, self, person)
  end
end
