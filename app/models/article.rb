class Article < ActiveRecord::Base

  validates :head, :body, presence: true

end
