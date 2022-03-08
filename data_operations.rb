require 'json'
require './book'
class SaveData
  def save(data, where)
    File.write("#{where}.JSON", JSON.generate(data))
  end

  def append(data, where)
    File.write("#{where}.JSON", JSON.generate(data), mode: "a")
  end
end

class SaveBooks < SaveData
  def save_all(data)
    new_data = data.map { |book| [book.title, book.author] }
    save(new_data, 'books')
  end
end

class LoadData
  def load(where)
    result = []
    unless File.read("#{where}.JSON") == ''
      result = JSON.parse(File.read("#{where}.JSON"))
    end
    puts result
    result
  end
end

class LoadBooks < LoadData
  def load_all(books)
    load('books').each do |book|
      binding.pry
      books << Book.new(book[0], book[1]) unless book.nil? || book == ''
    end
  end
end
