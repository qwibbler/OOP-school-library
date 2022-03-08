require './rental'

class MakeRental
  def new_rental(books, people)
    book = Select.new.select('book', books) { |val, i| PrintBook.new.print_info(val, i) }
    return WrongOption.new.print_message('No books found') if book.nil?

    person = Select.new.select('person', people) { |val, i| PrintPerson.new.print_info(val, i) }
    return WrongOption.new.print_message('No people found') if person.nil?

    print 'Date: '
    date = gets.chomp
    Rental.new(book, person, date)
    'Book successfully rented'
  end
end
