class Article < ActiveRecord::Base

  validates :headline, :bodytext, presence: true

end
