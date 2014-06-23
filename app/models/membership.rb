class Membership < ActiveRecord::Base

  belongs_to :user, dependent: :destroy
  belongs_to :organization, dependent: :destroy
  belongs_to :position

  validates :user_id, :organization_id, presence: true
  validates :user_id, uniqueness: true

end
