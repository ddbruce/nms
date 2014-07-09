class MediaTypes < ActiveRecord::Base

  validates :type_name, uniqueness: true

end
