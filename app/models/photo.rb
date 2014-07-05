class Photo < ActiveRecord::Base

  belongs_to :media

  mount_uploader :image, ImageUploader

end