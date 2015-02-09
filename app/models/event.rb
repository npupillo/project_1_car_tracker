class Event < ActiveRecord::Base
  belongs_to :vehicle
  has_many :vendors
  has_many :categories

  accepts_nested_attributes_for :vendors, :categories

  validates :name, presence: true
end

