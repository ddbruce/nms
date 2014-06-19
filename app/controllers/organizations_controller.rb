class OrganizationsController < ApplicationController

  def index
    @organizations = Organization.all
  end

  def show
    @organization = Organization.find(params[:id])

    membership = Membership.find_by_user_id(current_user.id)
    if membership
      @is_leader = membership.is_leader?
    end
  end

  def manage_members
    @organization = Organization.find(params[:id])
    @memberships = @organization.memberships

    @users = User.not_in_organization(@organization)
    if @users.length > 1
      @users.sort! { |a,b| a.name.downcase <=> b.name.downcase }
    end
  end

  def new
  end

  def create
    @organization = Organization.new(organization_params)
    @organization.save

    redirect_to @organization
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private 
    def organization_params 
       params.require(:organization).permit(:title)
    end

end
