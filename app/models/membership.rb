class Membership < ActiveRecord::Base

  belongs_to :user
  belongs_to :organization
  has_one :position

  validates :uid, :org_id, presence: true

end
