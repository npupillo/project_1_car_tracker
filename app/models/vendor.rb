class Vendor < ActiveRecord::Base
  has_many :events
  has_many :vehicles, through: :events

  validates :name, presence: true
end
