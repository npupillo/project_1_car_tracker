class Vendor < ActiveRecord::Base
  has_many :events, dependent: :destroy
  has_many :vehicles, thorugh: :events

end
