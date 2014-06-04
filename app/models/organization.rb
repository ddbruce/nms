class Organization < ActiveRecord::Base

  has_many :memberships, dependent: :destroy
  has_many :positions, dependent: :destroy

  validates :title, presence: true

end
