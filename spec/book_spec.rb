require 'rspec'
require_relative './spec_helper'

RSpec.describe Book do
  before :each do
    @book = Book.new('title', 'author')
    @person = Person.new(45, 'john')
  end

  describe '#new' do
    it 'should create a new book' do
      expect(@book).to be_instance_of(Book)
    end
    it 'should throw an error without only two arguments' do
      expect { Book.new('title') }.to raise_error(ArgumentError)
    end
  end

  describe '#properties' do
    it 'should return title' do
      expect(@book.title).to eq('title')
    end
    it 'should return author' do
      expect(@book.author).to eq('author')
    end
  end

  describe '#add_rental' do
    it 'should have initial empty rents' do
      expect(@book.rents).to eq([])
    end
    it 'should create a new rental' do
      @book.add_rental('now', @person)
      expect(@book.rents.length).to eq(1)
    end
    it 'should have rental person john' do
      @book.add_rental('now', @person)
      expect(@book.rents[0].person).to equal(@person)
    end
    it 'should have rental date now' do
      @book.add_rental('now', @person)
      expect(@book.rents[0].date).to eq('now')
    end
    it 'should have rents.length = 2 if w rents added' do
      @book.add_rental('yesterday', @person)
      @book.add_rental('now', @person)
      expect(@book.rents.length).to eq(2)
    end
  end
end
