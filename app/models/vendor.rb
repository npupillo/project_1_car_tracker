class Vendor < ActiveRecord::Base
  has_many :events
  has_many :vehicles, through: :events
end
