require './teacher'
require './student'

class LoadData
  def load(where)
    return nil unless File.exist?("#{where}.JSON")

    result = []
    result = JSON.parse(File.read("#{where}.JSON")) unless File.read("#{where}.JSON") == ''
    result
  end
end

class LoadBooks < LoadData
  def load_all(books)
    return nil if load('books').nil?

    load('books').each do |book|
      books << Book.new(book[0], book[1]) unless book.nil? || book == ''
    end
  end
end

class LoadPeople < LoadData
  def load_all(people)
    return nil if load('people').nil?

    load('people').each do |person|
      return nil if person.nil? || person == ''

      people << Teacher.new(person[5], person[1], person[2]) if person[0] == 'Teacher'

      people << Student.new('', person[1], person[2], parent_permission: person[4]) if person[0] == 'Student'
    end
  end
end
