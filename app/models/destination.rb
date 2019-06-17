class Destination < ApplicationRecord
  belongs_to :trip
  geocoded_by :address
  after_validation :geocode

  validates :name, presence: true
  validates :address, presence: true
end
