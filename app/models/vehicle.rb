class Vehicle < ActiveRecord::Base
  has_many :events, dependent: :destroy
  has_many :vendors, through: :events

end
