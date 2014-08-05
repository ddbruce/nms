module ApplicationHelper

	def page_title(content)
		content_for :page_title, content.to_s
	end

end
