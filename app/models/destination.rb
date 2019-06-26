class Destination < ApplicationRecord
  belongs_to :trip
  has_many :photos
  has_many :journals
  geocoded_by :address
  after_validation :geocode

  validates :name, presence: true
  validates :address, presence: true
end
