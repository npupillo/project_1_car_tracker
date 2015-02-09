class Vendor < ActiveRecord::Base
  belongs_to :events
  has_many :vehicles, through: :events

  validates :name, presence: true
end
