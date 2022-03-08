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
    books.push(Book.new(arr[0], arr[1]))
    puts 'Book created successfully'
  end
end
