class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :user_dashboard_path
  helper_method :manage_members_path
  helper_method :edit_positions_path

  def user_dashboard_path(user)
    "/users/#{user.id}/dashboard"
  end

  def manage_members_path(organization)
    "/organizations/#{organization.id}/manage_members"
  end

  def edit_positions_path(organization)
    "/organizations/#{organization.id}/edit_positions"
  end

  def after_sign_in_path_for(resource)
    if current_user
      "/users/#{current_user.id}/dashboard"
    else 
      "/"
    end
  end

end