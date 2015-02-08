require 'rails_helper'

RSpec.describe Vendor do
  describe '#create' do
    it 'creates a new Vendor' do
      expect(Vendor.create()).to be_a Vendor
    end

    it 'is valid with valid name' do
      expect(Vendor.create(name: 'Pep Boys')).to be_valid
    end

    it 'is invalid with a nil name' do
      expect(Vendor.create(name: nil)).not_to be_valid
    end

  end # describe '.create'
end
