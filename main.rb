require './person'
require './student'
require './teacher'
require './classroom'
require './book'
require './rental'
require './print_output'
require 'pry'
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
    return 'No books' if @books.empty?

    PrintBook.new.print_all(@books)
    return
  end

  def all_people
    puts 'People List: '
    return 'No people' if @people.empty?

    PrintPerson.new.print_all(@people)
    return
  end

  def make_person
    print 'Do you want to create a student (1) or a teacher (2)? '
    opt = gets.chomp
    return wrong_option unless %w[1 2].include? opt

    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    return create_student(age.to_i, name) if opt == '1'
    return create_teacher(age.to_i, name) if opt == '2'
  end

  def create_student(age, name)
    print 'Has Parent Permission? [Y/N]: '
    pp = gets.chomp
    return wrong_option unless %w[y n].include? pp.downcase

    @people << Student.new('', age, name, parent_permission: pp.downcase == 'y')
    'Student created successfully'
  end

  def create_teacher(age, name)
    print 'Specialization: '
    spec = gets.chomp
    @people << Teacher.new(spec, age, name)
    'Teacher created successfully'
  end

  def make_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    book = Book.new(title, author)
    @books << book
    'Book created successfully'
  end

  def select_book
    puts 'Select a book from the following selection by number: '
    @books.each_with_index { |book, index| puts print_book(book, index) }
    book = gets.chomp
    book = book.to_i
    return 'wrong_option' unless book.positive? && book <= @books.length

    puts "You have chosen (#{print_book(@books[book - 1], book - 1)}."
    @books[book - 1]
  end

  def select_person
    puts 'Select a person from the following selection by number (not id): '
    @people.each_with_index { |person, index| puts print_person(person, index) }
    person = gets.chomp
    person = person.to_i
    return 'wrong_option' unless person.positive? && person <= @people.length

    puts "You have chosen (#{print_person(@people[person - 1], person - 1)}."
    @people[person - 1]
  end

  def rent_book
    if @books.empty?
      puts 'No books found. Create a new book:'
      return make_book
    end
    if @people.empty?
      puts 'No people found. Create a new person:'
      return make_person
    end
    book = select_book
    return wrong_option if book == 'wrong_option'

    person = select_person
    return wrong_option if person == 'wrong_option'

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
