class Article < ActiveRecord::Base

  validates :headline, :bodytext, presence: true

  belongs_to :user
  belongs_to :organization

end
