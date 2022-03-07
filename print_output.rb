class PrintOutput
  def print_output(output, &block)
    output.each_with_index(&block)
  end
end

class PrintBook < PrintOutput
  def print_info(book, index = nil)
    puts "#{index + 1}) #{book.title} by #{book.author}"
  end

  def print_all(output)
    print_output(output) { |val, i| print_info(val, i) }
  end
end

class PrintPerson < PrintOutput
  def print_info(person, index = nil)
    puts "#{index + 1}) [#{person.class.name}] ID: #{person.id}, Name: #{person.name}, Age: #{person.age}"
  end

  def print_all(output)
    print_output(output) { |val, i| print_info(val, i) }
  end
end

class PrintRental < PrintOutput
  def print_info(rent, index = nil)
    puts "#{index + 1}) Date: #{rent.date}, Book: #{rent.book.title} by #{rent.book.author}"
  end

  def print_all(output)
    print_output(output) { |val, i| print_info(val, i) }
  end
end
