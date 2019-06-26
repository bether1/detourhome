class Photo < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  belongs_to :destination

  def photo_url
    super || default_photo
  end
end
