class Article < ActiveRecord::Base

  validates :headline, :bodytext, presence: true

  belongs_to :user
  belongs_to :organization
  has_many :medias

  def photos
  	article.medias.where(media_type: 1, article_id: id).sample
  end

end
