module ArticlesHelper

	def can_edit_article?(article)
		# Determine if current user has permissions to edit and article
		if current_user.is_admin? 
			# user is system admin
			return true
		elsif article.user_id == current_user.id
			# user is article author
			return true
		elsif organization = Organization.find_by_id(article.organization_id)
			organization.leaders.each do |leader|
				if leader.user_id == current_user.id
					# user is publishing organization's leader
					return true
				else
					return false
				end
			end
		else
			return false
		end
	end

end