require 'rspec'
require_relative './spec_helper'

describe Rental do
  before :each do
    @person = Person.new(89)
    @book = Book.new('title', 'author')
    @rental = Rental.new(@book, @person, 'now')
  end

  describe '#new' do
    it 'should throw an error without correct number of arguments' do
      expect { Rental.new }.to raise_error ArgumentError
    end

    it 'should throw an error without a Book' do
      expect { Rental.new(noBook, @person, 'now') }.to raise_error NameError
    end

    it 'should throw an error without a Person' do
      expect { Rental.new(@book, noPerson, 'now') }.to raise_error NameError
    end

    it 'should create a rental and not throw an error without a date' do
      expect(Rental.new(@book, @person)).to be_instance_of(Rental)
    end
  end

  describe 'Rental Attributes' do
    it 'should return person' do
      expect(@rental.person).to be(@person)
    end

    it 'should return book' do
      expect(@rental.book).to be(@book)
    end

    it 'should return date' do
      expect(@rental.date).to eq('now')
    end
  end

  describe 'Rental Added to Book/Person' do
    it 'should return rental' do
      expect(@person.rents[0]).to be(@rental)
    end
    it 'should return rental' do
      expect(@book.rents[0]).to be(@rental)
    end
  end
end
