class Book
  attr_accessor :title, :author, :rents

  def initialize(title, author)
    @title = title
    @author = author
    @rents = []
  end
end
