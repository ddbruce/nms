class Position < ActiveRecord::Base

  belongs_to :oganization, dependent: :destroy
  has_many :memberships

end
