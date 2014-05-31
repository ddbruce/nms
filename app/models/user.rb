class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :memberships, dependent: :destroy

  validates :fname, :lname, :RIN, presence: true

  def name
    # Return the user's full name
    (fname || " ") + " " + (lname || " ")
  end

  def organizations
    # Return all organizations a user is a member of
    organizations = Array.new()
    Membership.where(uid: self.id).each do |mem|
      organizations << Organization.find(mem.org_id)
    end
    organizations
  end

end
