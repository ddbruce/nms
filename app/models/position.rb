class Position < ActiveRecord::Base

  belongs_to :oganization
  has_many :memberships

end
