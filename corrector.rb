class Corrector
  def initialize() end

  def correct_name(name)
    name.capitalize[0...10]
  end
end

puts 'BEGIN CORRECTOR TEST'
print Corrector.new.correct_name('12345678901234567890'), ' = 1234567890'
puts
print Corrector.new.correct_name('supercalafragalistic'), ' = Supercalaf'
puts
puts 'END CORRECTOR TEST'
puts
