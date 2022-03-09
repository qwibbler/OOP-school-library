require 'rspec'
require_relative './spec_helper'

describe Corrector do
  it 'should cut string off at 10 characters' do
    corrector = Corrector.new.correct_name('12345678901234567890')
    expect(corrector.length).to eq(10)
  end

  it 'should capitalize a name' do
    corrector = Corrector.new.correct_name('john')
    expect(corrector).to eq('John')
  end

  it 'should cut string off at 10 AND capitalize' do
    corrector = Corrector.new.correct_name('supercalafragalistic')
    expect(corrector).to eq('Supercalaf')
  end
end
