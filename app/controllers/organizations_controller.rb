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
    @memberships = Membership.where(organization_id: @organization.id, approval_status: 1)
    @positions = @organization.positions
    
    @requests = Membership.where(organization_id: @organization.id, approval_status: 0)
    @rejections = Membership.where(organization_id: @organization.id, approval_status: 2)

    @users = User.not_in_organization(@organization)
    if @users.length > 1
      @users = @users.sort { |a,b| a.name.downcase <=> b.name.downcase }
      @users = @users.collect! {|u| [u.name, u.id ] }
    elsif @users.length == 1
      @users = [[@users[0].name, @users[0].id]]
    end

    if @positions.length > 1
      @positions = @positions.sort { |a,b| a.title.downcase <=> b.title.downcase }
      @positions = @positions.collect! {|p| [p.title, p.id ] }
    elsif @positions.length == 1
      @positions = [[@positions[0].title, @positions[0].id]]
    end
  end

  def join
    membership = Membership.new( user_id: current_user.id,
      organization_id: params[:organization_id],
      is_leader: false, approval_status: 0)

    membership.save 

    redirect_to organizations_path
  end

  def moderate_membership
    membership = Membership.find(params[:membership_id])
    membership.update_attributes(approval_status: params[:approval_status])

    redirect_to manage_members_path(Organization.find(params[:organization_id]))
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
