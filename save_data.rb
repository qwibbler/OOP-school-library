require 'json'
require './book'
require 'pry'

class SaveData
  def save(data, where)
    File.write("#{where}.JSON", JSON.generate(data))
  end
end

class SaveBooks < SaveData
  def save_all(data)
    new_data = data.map { |book| [book.title, book.author] }
    save(new_data, 'books')
  end
end

class SavePeople < SaveData
  def save_all(data)
    new_data = data.map do |person|
      arr = [
        person.class.name,
        person.age,
        person.name,
        person.id,
        person.can_use_services?
      ]
      arr.push(person.specialization) if person.instance_of?(Teacher)
      arr
    end
    save(new_data, 'people')
  end
end
