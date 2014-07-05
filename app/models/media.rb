class Media < ActiveRecord::Base

  belongs_to :user
  belongs_to :organization

  has_many :photos 

end
