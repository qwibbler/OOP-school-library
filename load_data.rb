require './teacher'
require './student'
require './rental'

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

    former_ids = []

    load('books').each do |book|
      books << Book.new(book[0], book[1]) unless book.nil? || book == ''
      former_ids << book[2]
    end
    former_ids
  end
end

class LoadPeople < LoadData
  def load_all(people)
    return nil if load('people').nil?

    former_ids = []

    load('people').each do |person|
      return nil if person.nil? || person == ''

      former_ids << person[3]
      people << Teacher.new(person[5], person[1], person[2]) if person[0] == 'Teacher'
      people << Student.new('', person[1], person[2], parent_permission: person[4]) if person[0] == 'Student'
    end
    former_ids
  end
end

class LoadRentals < LoadData
  def load_all(people, people_ids, books, book_ids) # rubocop:disable Metrics/CyclomaticComplexity
    return nil if load('rentals').nil?

    load('rentals').each do |renter_p_id, arr_date_book_id|
      return nil if renter_p_id.nil? || renter_p_id == ''

      p_index = people_ids.find_index { |id| id == renter_p_id.to_i }
      person = people[p_index]

      arr_date_book_id.each do |date_id|
        b_index = book_ids.find_index { |id| id == date_id[1] }
        book = books[b_index]
        Rental.new(book, person, date_id[0])
      end
    end
  end
end
