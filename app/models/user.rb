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

end
