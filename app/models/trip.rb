class Trip < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :description, presence: true

  def show
  end
end
