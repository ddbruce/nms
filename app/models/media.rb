class Media < ActiveRecord::Base

  belongs_to :user
  belongs_to :organization

  before_destroy :remove_media

  def self.create_using_upload_type(params, user)
    media = nil

    if params.has_key? :photo
      photo = Photo.new(Media.photo_params(params))
      
      if photo.save
        media = Media.new(
          media_type: MediaTypes.find_by_type_name("Photo").id,
          media_id: photo.id,
          user_id: user.id
        )
        media.save
      end

    elsif params.has_key? :xml

    end

    return media
  end

  def remove_media
    if MediaTypes.find(media_type).type_name == "Photo" 
      photo = Photo.find_by_id(media_id)
      if photo
        photo.destroy
      end
    end
  end

  private
    def self.photo_params(params)
      params.require(:photo).permit(:image)
    end

end