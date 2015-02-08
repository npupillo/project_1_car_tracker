require 'rails_helper'

RSpec.describe Category do
  describe '#create' do
    it 'creates a new Category' do
      expect(Category.create()).to be_a Category
    end

    it 'is valid with valid name' do
      expect(Category.create(name: 'natural disaster')).to be_valid
    end

    it 'is invalid with a nil name' do
      expect(Category.create(name: nil)).not_to be_valid
    end

  end # describe '.create'
end
