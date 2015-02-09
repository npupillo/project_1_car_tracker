class Vendor < ActiveRecord::Base
  belongs_to :events
  has_many :vehicles, through: :events

  accepts_nested_attributes_for :events, :vehicles

  validates :name, presence: true
end
