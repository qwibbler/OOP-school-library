require 'rspec'
require_relative './spec_helper'

describe Teacher do
  before :each do
    @teacher = Teacher.new('Spec', 17, 'Santiago', parent_permission: false)
  end

  describe '#new' do
    it 'should throw an error if invalid number of arguments' do
      expect { Teacher.new }.to raise_error ArgumentError
    end

    it 'should create a teacher' do
      expect(@teacher).to be_instance_of(Teacher)
    end

    it "should return the teacher's specialization" do
      expect(@teacher.specialization).to eq('Spec')
    end
  end

  describe '#can_use_services?' do
    it 'should always return true even if not of age and parent_permission: false' do
      expect(@teacher.can_use_services?).to eq(true)
    end
  end
end
