class Section < ActiveRecord::Base

  validates :title, presence: true

  def self.active_sections
    Section.where(is_active: true)
  end

  def self.sections_for_select
    sections = Section.all
    if sections.length > 1
      sections = sections.sort { |a,b| a.title.downcase <=> b.title.downcase }
      sections = sections.collect! {|s| [s.title, s.id ] }
    elsif sections.length == 1
      sections = [[sections[0].title, sections[0].id]]
    end
  end

end
