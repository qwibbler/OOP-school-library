require './print_output'
require './person_methods'
require './book_methods'
require './selection_methods'
require './wrong_option'
require './rental_methods'
require './data_operations'
require 'pry'
class App
  def initialize
    @people = []
    @books = []
  end

  def load
    LoadBooks.new.load_all(@books)
    puts @books
    options
  end

  def options
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
    puts
    opt = gets.chomp
    puts
    return end_program if %w[7 q quit exit].include? opt

    run_option(opt)
  end

  def run_option(option)
    case option
    when '1' then PrintBook.new.print_all(@books)
    when '2' then PrintPerson.new.print_all(@people)
    when '3' then CreatePerson.new.choose_person(@people)
    when '4' then AddBook.new.add_book(@books)
    when '5' then MakeRental.new.new_rental(@books, @people)
    when '6' then PrintRental.new.list_rents(@people)
    else WrongOption.new.print_message
    end
    options
  end

  def end_program
    SaveBooks.new.save_all(@books)
    puts 'Goodbye'
    puts
  end
end

def main
  app = App.new
  puts [
    '',
    'Welcome to the School Library App',
    ''
  ]
  app.load
end

main
