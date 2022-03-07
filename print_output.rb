class PrintOutput
  def print_output(output, &block)
    output.each_with_index(&block)
  end
end

class PrintBook < PrintOutput
  def print_info(book, index = nil)
    "#{index + 1}) #{book.title} by #{book.author}"
  end

  def print_all(output)
    return puts 'No books' if output.empty?

    print_output(output) { |val, i| puts print_info(val, i) }
  end
end

class PrintPerson < PrintOutput
  def print_info(person, index = nil)
    "#{index + 1}) [#{person.class.name}] ID: #{person.id}, Name: #{person.name}, Age: #{person.age}"
  end

  def print_all(output)
    return puts 'No people' if output.empty?

    print_output(output) { |val, i| puts print_info(val, i) }
  end
end

class PrintRental < PrintOutput
  def list_rents(people)
    print 'Enter person ID: '
    id = gets.chomp
    renting_person = people.find { |person| person.id == id.to_i }
    return WrongOption.new.print_message('No rentals found with that ID') unless renting_person

    print_all(renting_person.rents)
    nil
  end

  def print_info(rent, index = nil)
    "#{index + 1}) Date: #{rent.date}, Book: #{rent.book.title} by #{rent.book.author}"
  end

  def print_all(output)
    return puts 'No rental information has been found' if output.empty?

    print_output(output) { |val, i| puts print_info(val, i) }
  end
end
