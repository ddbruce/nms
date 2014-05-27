class Organization < ActiveRecord::Base

  has_many :memberships, dependent: :destroy

  validates :title, presence: true

end
