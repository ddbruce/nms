class Membership < ActiveRecord::Base

  belongs_to :user
  belongs_to :organization
  has_one :position

  validates :user_id, :organization_id, presence: true

end
