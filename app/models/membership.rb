class Membership < ActiveRecord::Base

  belongs_to :user
  belongs_to :organization
  belongs_to :position

  validates :user_id, :organization_id, presence: true
  validates :user_id, uniqueness: { scope: :organization_id }

  # 0 is membership pending, 1 is membership accepted, 2 is membership denied
  validates :approval_status, presence: true

end
