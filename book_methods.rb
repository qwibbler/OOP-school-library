class CreateBook
  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    Book.new(title, author)
  end
end
