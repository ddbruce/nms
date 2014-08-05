class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  has_many :memberships, dependent: :destroy
  has_many :articles
  has_many :medias

  validates :fname, :lname, :RIN, presence: true


  def name
    # Return the user's full name
    (fname || " ") + " " + (lname || " ")
  end

  def organizations
    # Return all organizations a user is a member of
    organizations = Array.new()
    Membership.where(user_id: self.id).each do |mem|
      organizations << Organization.find(mem.organization_id)
    end
    organizations
  end

  def is_organization_leader?(organization)
    mem = memberships.find_by_organization_id(organization.id)
    if mem.is_leader == true
      return true
    end
  end

  def self.not_in_organization(organization)
    memberships = organization.memberships

    memberships = memberships.collect! { |mem| mem.user }

    results = Array.new()
    User.all.each do |user|
      if !memberships.include? user
        results << user
      end
    end

    results
  end


end
