require 'date'
class Rental
  attr_accessor :date, :book, :person

  def initialize(book, person, date = DateTime.now())
    @date = date

    @book = book
    book.rents << self

    @person = person
    person.rents << self
  end
end
