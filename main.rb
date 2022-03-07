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
    when '6' then list_rents
    else wrong_option
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
    @books << CreateBook.new.create_book
    'Book created successfully'
  end

  def rent_book
    book = Select.new.select('book', @books) { |val, i| PrintBook.new.print_info(val, i) }
    person = Select.new.select('person', @people) { |val, i| PrintPerson.new.print_info(val, i) }
    print 'Date: '
    date = gets.chomp
    Rental.new(book, person, date)
    'Book successfully rented'
  end

  def list_rents
    print 'Enter person ID: '
    id = gets.chomp
    renting_person = @people.find { |person| person.id == id.to_i }
    return wrong_option unless renting_person

    renting_person.rents.each_with_index do |rent, index|
      puts "#{index + 1}) Date: #{rent.date}, Book: #{rent.book.title} by #{rent.book.author}"
    end
    return 'No Rental Information' if renting_person.rents.empty?
  end

  def end_program
    puts 'Goodbye'
    puts
  end

  def wrong_option
    'That was not a valid option'
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
