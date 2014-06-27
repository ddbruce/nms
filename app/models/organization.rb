class Organization < ActiveRecord::Base

  has_many :memberships, dependent: :destroy
  has_many :positions, dependent: :destroy
  has_many :articles

  validates :title, presence: true


  def self.sections_for_select(user)
    organizations = Array.new

    user.memberships.each do |mem| 
      organizations << mem.organization
    end

    if organizations.length > 1
      organizations = organizations.sort { |a,b| a.title.downcase <=> b.title.downcase }
      organizations = organizations.collect! {|org| [org.title, org.id ] }
    elsif organizations.length == 1
      organizations = [[organizations[0].title, organizations[0].id]]
    end
  end

end
