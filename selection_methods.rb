require './print_output'
require './wrong_option'
require 'pry'

class Select
  def select(item, selection, &block)
    return nil if selection.empty?

    puts "Select a #{item} from the following selection by number: "
    selection.each_with_index { |val, i| puts yield(val, i) }
    selected = gets.chomp.to_i
    unless selected.positive? && selected <= selection.length
      WrongOption.new.print_message
      return select(item, selection, &block)
    end

    puts "You have chosen (#{yield(selection[selected - 1], (selected - 1))}."
    selection[selected - 1]
  end
end
