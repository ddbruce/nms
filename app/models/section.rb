class Section < ActiveRecord::Base

  validates :title, presence: true

  def self.active_sections
    Section.where(is_active: true)
  end

end
