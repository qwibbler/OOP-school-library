require 'rspec'
require_relative './spec_helper'

describe Student do
  before :each do
    @student = Student.new('Classroom 22', 26, 'Santiago')
    @classroom = Classroom.new('Classroom 23')
  end

  describe '#new' do
    it 'should throw an error if invalid number of arguments' do
      expect { Student.new }.to raise_error ArgumentError
    end

    it 'should create a Student' do
      expect(@student).to be_instance_of(Student)
    end

    it "should return the student's classroom" do
      expect(@student.classroom).to eq('Classroom 22')
    end
  end

  describe '#play_hooky' do
    it 'should return string' do
      expect(@student.play_hooky).to eq("¯\(ツ)/¯")
    end
  end

  describe '#change_classroom=' do
    it 'should throw an error if no arguments' do
      expect { @student.change_classroom }.to raise_error NoMethodError
    end

    it 'should throw an error if incorrect classroom' do
      expect { @student.change_classroom = (2) }.to raise_error NameError
    end

    it 'should change the classroom' do
      @student.change_classroom = (@classroom)
      expect(@student.classroom).to be(@classroom)
    end
  end
end
