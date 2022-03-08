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
  def add_book
    arr = create_book
    Book.new(arr[0], arr[1])
  end
end
