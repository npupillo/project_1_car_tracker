class Event < ActiveRecord::Base
  belongs_to :vehicle
  belongs_to :vendor
  belongs_to :category

  validates :name, presence: true
end

