require './person'
require './student'
require './teacher'
require './classroom'
require './book'
require './rental'
require './print_output'
require './person_methods'
require './book_methods'
require './selection_methods'
require './wrong_option'
class App
  def initialize
    @people = []
    @books = []
  end

  def option_chosen(option)
    case option
    when '1' then all_books
    when '2' then all_people
    when '3' then make_person
    when '4' then make_book
    when '5' then rent_book
    when '6' then PrintRental.new.list_rents(@people)
    else WrongOption.new.print_message
    end
  end

  def all_books
    puts 'Books List: '
    PrintBook.new.print_all(@books)
    nil
  end

  def all_people
    puts 'People List: '
    PrintPerson.new.print_all(@people)
    nil
  end

  def make_person
    print 'Do you want to create a student (1) or a teacher (2)? '
    opt = gets.chomp
    return WrongOption.new.print_message unless %w[1 2].include? opt

    @people.push(CreateStudent.new.create_student) if opt == '1'
    @people.push(CreateTeacher.new.create_teacher) if opt == '2'
    nil
  end

  def make_book
    @books << AddBook.new.add_book
    'Book created successfully'
  end

  def rent_book
    book = Select.new.select('book', @books) { |val, i| PrintBook.new.print_info(val, i) }
    return WrongOption.new.print_message('No books found') if book.nil?

    person = Select.new.select('person', @people) { |val, i| PrintPerson.new.print_info(val, i) }
    return WrongOption.new.print_message('No people found') if person.nil?

    print 'Date: '
    date = gets.chomp
    Rental.new(book, person, date)
    'Book successfully rented'
  end

  def end_program
    puts 'Goodbye'
    puts
  end
end

def options(app)
  puts [
    '',
    'Please choose an option by entering a number',
    '1 - List all books',
    '2 - List all people',
    '3 - Create a person',
    '4 - Create a book',
    '5 - Create a rental',
    '6 - List all rentals for a given person id',
    '7 - Exit'
  ]
  opt = gets.chomp
  puts
  return app.end_program if %w[7 q quit exit].include? opt

  puts app.option_chosen(opt)
  options(app)
end

def main
  app = App.new
  puts [
    '',
    'Welcome to the School Library App',
    ''
  ]
  options(app)
end

main
