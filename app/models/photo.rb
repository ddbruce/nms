class Photo < ActiveRecord::Base

  mount_uploader :image, ImageUploader

  after_destroy :remove_media_record

  def remove_media_record
    media_record = Media.find_by_media_id(id) 
    if media_record
      media_record.destroy
    end
  end

end 