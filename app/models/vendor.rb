class Vendor < ActiveRecord::Base
  has_many :events
  has_many :vehicles
  has_many :vehicles, through: :events

  accepts_nested_attributes_for :events, :vehicles

  validates :name, presence: true
end
