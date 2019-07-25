class Trip < ApplicationRecord
  belongs_to :user
  has_many :destinations
  geocoded_by :address
  after_validation :geocode

  validates :name, presence: true
  validates :description, presence: true
end
