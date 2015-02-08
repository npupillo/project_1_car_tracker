require 'rails_helper'

RSpec.describe Vehicle do
  describe '#create' do
    it 'creates a new vehicle' do
      expect(Vehicle.create()).to be_a Vehicle
    end

    it 'is valid with valid fields' do
      expect(Vehicle.create(nickname: 'My Amazing Car', make: 'DeLorean', model: 'DMC-12', year: 1985, mileage: 30, purchase_date: '1985-07-03')).to be_valid
    end

    it 'is invalid with a nil nickname' do
      expect(Vehicle.create(nickname: nil, make: 'DeLorean', model: 'DMC-12', year: 1985, mileage: 30, purchase_date: '1985-07-03')).not_to be_valid
    end

    it 'is invalid with a nil make' do
      expect(Vehicle.create(nickname: 'My Amazing Car', make: nil, model: 'DMC-12', year: 1985, mileage: 30, purchase_date: '1985-07-03')).not_to be_valid
    end

    it 'is invalid with a nil model' do
      expect(Vehicle.create(nickname: 'My Amazing Car', make: 'DeLorean', model: nil, year: 1985, mileage: 30, purchase_date: '1985-07-03')).not_to be_valid
    end

    it 'is invalid with a nil year' do
      expect(Vehicle.create(nickname: 'My Amazing Car', make: 'DeLorean', model: 'DMC-12', year: nil, mileage: 30, purchase_date: '1985-07-03')).not_to be_valid
    end

    it 'is invalid with a nil mileage' do
      expect(Vehicle.create(nickname: 'My Amazing Car', make: 'DeLorean', model: 'DMC-12', year: 1985, mileage: nil, purchase_date: '1985-07-03')).not_to be_valid
    end

    it 'is invalid with a nil purchase_date' do
      expect(Vehicle.create(nickname: 'My Amazing Car', make: 'DeLorean', model: 'DMC-12', year: 1985, mileage: 30, purchase_date: nil)).not_to be_valid
    end

  end # describe '.create'
end
