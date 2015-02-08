class Vehicle < ActiveRecord::Base
  has_many :events, dependent: :destroy
  has_many :vendors, through: :events
  has_many :categories, through: :events

  accepts_nested_attributes_for :events, :vendors, :categories
end
