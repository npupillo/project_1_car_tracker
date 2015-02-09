require 'rails_helper'

RSpec.describe Event do
  describe '#create' do
    it 'creates a new vehicle' do
      expect(Event.create()).to be_a Event
    end

    it 'is valid with valid name' do
      expect(Event.create(name: 'worst car ever')).to be_valid
    end

    it 'is valid with valid name' do
      expect(Event.create(name: nil)).not_to be_valid
    end

  end # describe '.create'
end
