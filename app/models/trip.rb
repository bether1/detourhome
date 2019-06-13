class Trip < ApplicationRecord
  belongs_to :user
  has_many :destinations
  validates :name, presence: true
  validates :description, presence: true
  def show
  end
end
