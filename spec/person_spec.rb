require 'rspec'
require_relative './spec_helper'

describe Person do
  before :each do
    @person = Person.new(26, 'Santiago')
    @underage = Person.new(5, 'DaBaby', parent_permission: false)
    @baby = Person.new(2, 'DaOthaBaby')
    @badboy = Person.new(19, 'SupaBad', parent_permission: false)
    @book = Book.new('The Bible', 'Moses')
  end

  describe '#new' do
    it 'should throw an error' do
      expect{ Person.new }.to raise_error ArgumentError
    end

    it 'should create a new person' do
      expect(@person).to be_instance_of(Person)
    end

    it 'should return Unkown if name is not provided' do
      expect(Person.new(26).name).to eq('Unknown')
    end

    it 'should return the age' do
      expect(@person.age).to eq(26)
    end

    it 'should return the name' do
      expect(@person.name).to eq('Santiago')
    end
  end

  describe '#can_use_services?' do
    it 'should return true if of_age?' do
      expect(@person.can_use_services?).to be(true)
    end

    it 'should return false if !of_age? and parent_permission: false' do
      expect(@underage.can_use_services?).to be(false)
    end

    it 'should return true if !of_age? but parent_permission: true' do
      expect(@baby.can_use_services?).to be(true)
    end

    it 'should return true if of_age? but parent_permission: false' do
      expect(@badboy.can_use_services?).to be(true)
    end
  end

  describe '#validate_name' do
    it 'should return capitalized name' do
      uglyname = Person.new(120, 'jUan')
      uglyname.validate_name
      expect(uglyname.name).to eq('Juan')
    end

    it 'should return truncated name' do
      longname = Person.new(120, 'jUan francisco de la espriella')
      longname.validate_name
      expect(longname.name).to eq('Juan franc')
    end
  end

  describe '#add_rental' do
    it 'should throw an error if incorrect number of parameters' do
      expect{ @person.add_rental }.to raise_error ArgumentError
    end

    it 'should throw an error if book is not a Book' do
      expect{ @person.add_rental('now', 'Whatever') }.to raise_error NameError
    end

    it 'should return an empty array at first' do
      expect(@person.rents.length).to be(0)
    end

    it 'should add a rental' do
      @person.add_rental('now', @book)
      expect(@person.rents.length).to be(1)
    end

    it 'should add the book within the rental' do
      @person.add_rental('now', @book)
      expect(@person.rents[0].book).to be(@book)
    end

    it 'should be the correct date' do
      @person.add_rental('now', @book)
      expect(@person.rents[0].date).to eq('now')
    end
  end
end
