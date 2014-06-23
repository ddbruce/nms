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
    @positions = @organization.positions

    @users = User.not_in_organization(@organization)
    if @users.length > 1
      @users.sort! { |a,b| a.name.downcase <=> b.name.downcase }
      @users = @users.all.collect! {|u| [u.name, u.id ] }
    elsif @users.length == 1
      @users = [[@users[0].name, @users[0].id]]
    end

    if @positions.length > 1
      @positions.sort! { |a,b| a.title.downcase <=> b.title.downcase }
      @positions = @positions.all.collect! {|p| [p.title, p.id ] }
    elsif @positions.length == 1
      @positions = [[@positions[0].title, @positions[0].id]]
    end
  end

  def edit_positions
    @organization = Organization.find(params[:id])
    @positions = @organization.positions
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
