require './book'
class CreateBook
  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    [title, author]
  end
end

class AddBook < CreateBook
  def add_book(books)
    arr = create_book
    # binding.pry
    books.push(Book.new(arr[0], arr[1]))
    puts 'Book created successfully'
    # binding.pry
  end
end
