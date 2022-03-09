require 'rspec'
require_relative './spec_helper'

RSpec.describe Classroom do
  before :each do
    @classroom = Classroom.new('Classroom 22')
    @student = Student.new('Classroom 22', 26, 'Santiago')
  end

  describe '#new' do
    it 'should create a new classroom' do
      expect(@classroom).to be_instance_of Classroom 
    end

    it 'should throw an error without an argument' do
      expect{ Classroom.new }.to raise_error ArgumentError
    end
  end

  describe '#add_student' do
    it 'should be an empty classroom' do
      expect(@classroom.students).to eq([])
    end

    it 'should add a student' do
      @classroom.add_student=(@student)
      expect(@classroom.students.length).to eq(1)
    end

    it 'should be a student' do
      @classroom.add_student=(@student)
      expect(@classroom.students[0]).to equal(@student)
    end

    it 'should have Classroom 22' do
      @classroom.add_student=(@student)
      expect(@classroom.students[0].classroom).to be(@classroom)
    end

    it 'only adds student once' do
      @classroom.add_student=(@student)
      @classroom.add_student=(@student)
      expect(@classroom.students.length).to eq(1)
    end
  end
end
