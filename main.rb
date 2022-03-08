require './print_output'
require './person_methods'
require './book_methods'
require './selection_methods'
require './wrong_option'
require './rental_methods'
class App
  def initialize
    @people = []
    @books = []
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
    when '3' then make_person
    when '4' then make_book
    when '5' then MakeRental.new.new_rental(@books, @people)
    when '6' then PrintRental.new.list_rents(@people)
    else WrongOption.new.print_message
    end
    options
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

  def end_program
    puts 'Goodbye'
    puts
  end
end

# def options(app)
#   opt = gets.chomp
#   puts
#   return app.end_program if %w[7 q quit exit].include? opt

#   puts app.option_chosen(opt)
#   options(app)
# end

def main
  app = App.new
  puts [
    '',
    'Welcome to the School Library App',
    ''
  ]
  app.options
end

main
