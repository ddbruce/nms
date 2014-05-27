class Membership < ActiveRecord::Base

  belongs_to :user
  belongs_to :organization

  validates :uid, :org_id, presence: true

end
