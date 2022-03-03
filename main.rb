#!/usr/bin/env ruby

require './person'
require './student'
require './teacher'
require './classroom'
require './book'
require './rental'
class App
  def initialize
    @people = []
    @books = []
  end

  def welcome
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
    option_chosen(gets.chomp)
  end

  def option_chosen(option) # rubocop:disable Metrics/CyclomaticComplexity
    case option
    when '1'
      all_books
    when '2'
      all_people
    when '3'
      make_person
    when '4'
      make_book
    when '5'
      rent_book
    when '6'
      list_rents
    when '7', 'q', 'quit', 'exit'
      end_program
    else
      returns wrong_option
    end
  end

  def all_books
    puts 'Books List: '
    @books.each_with_index { |book, index| puts print_book(book, index) }
    puts 'No books' if @books.empty?
    welcome
  end

  def print_book(book, index = nil)
    "#{index + 1}) #{book.title} by #{book.author}"
  end

  def all_people
    puts 'People List: '
    @people.each_with_index { |person, index| puts print_person(person, index) }
    puts @people.empty? ? 'No people' : ''
    welcome
  end

  def print_person(person, index = 1)
    "#{index + 1}) [#{person.class.name}] ID: #{person.id}, Name: #{person.name}, Age: #{person.age}"
  end

  def make_person
    puts 'Do you want to create a student (1) or a teacher (2)?'
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
    returns wrong_option unless %w[y n].include?(pp.downcase)

    @people << Student.new(age, name, parent_permission: pp.downcase == 'y')
    puts 'Student created successfully'
    welcome
  end

  def create_teacher(age, name)
    print 'Specialization: '
    spec = gets.chomp
    @people << Teacher.new(spec, age, name)
    puts 'Teacher created successfully'
    welcome
  end

  def make_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    book = Book.new(title, author)
    @books << book
    puts 'Book created successfully'
    welcome
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
    person = select_person
    print 'Date: '
    date = gets.chomp
    Rental.new(book, person, date)
    puts 'Book successfully rented'
    welcome
  end

  def select_book
    puts 'Select a book from the following selection by number: '
    @books.each_with_index { |book, index| puts print_book(book, index) }
    book = gets.chomp
    book = book.to_i
    returns wrong_option unless book.positive? && book <= @books.size

    puts "You have chosen (#{print_book(@books[book - 1], book - 1)}."
    @books[book - 1]
  end

  def select_person
    puts 'Select a person from the following selection by number (not id): '
    @people.each_with_index { |person, index| puts print_person(person, index) }
    person = gets.chomp
    person = person.to_i
    returns wrong_option unless person.positive? && person <= @people.size

    puts "You have chosen (#{print_person(@people[person - 1], person - 1)}."
    @people[person - 1]
  end

  def list_rents
    print 'Enter person ID: '
    id = gets.chomp
    renting_person = @people.find { |person| person.id == id.to_i }
    wrong_option unless renting_person
    renting_person.rents.each do |rent|
      puts "Date: #{rent.date}, Book: #{rent.book.title} by #{rent.book.author}"
    end
    puts 'No Rental Information' if renting_person.rents.empty?
    welcome
  end

  def end_program
    puts 'Goodbye'
    puts
  end

  def wrong_option
    puts 'That was not a valid option'
    welcome
  end
end

def main
  puts [
    '',
    'Welcome to the School Library App',
    ''
  ]
  app = App.new
  app.welcome
end

main
