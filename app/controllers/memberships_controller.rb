class MembershipsController < ApplicationController

  def index
    @memberships = Membership.all
  end

  def create
    organization = Organization.find(params[:organization_id])

    membership = Membership.new(membership_params)
    membership.organization_id = params[:organization_id]

    # Set membership approval status
    #
    # System administrators: auto-approve
    if current_user.is_admin?
      membership.approval_status = 1
    # Group leaders: auto-approve only if adding to this organization
    elsif current_user.is_organization_leader?(organization)
      membership.approval_status = 1
    # Basic user: approval pending from system admin or organization leader
    else
      membership.approval_status = 0
    end

    membership.save

    redirect_to organization_path(params[:organization_id])
  end

  def destroy
    membership = Membership.find(params[:id])

    if membership
      membership.destroy
    end

    redirect_to manage_members_path(Organization.find(params[:organization_id]))
  end

  def add_position
    membership = Membership.find(params[:membership_id])
    membership.update_attributes(add_position_params)

    redirect_to manage_members_path(Organization.find(params[:organization_id]))
  end

  def leadership_status
    membership = Membership.find(params[:id])

    if membership.is_leader
      membership.is_leader = 0
    else
      membership.is_leader = 1
    end

    membership.save

    redirect_to manage_members_path(Organization.find(params[:organization_id]))
  end

  private

    def membership_params
      params.require(:membership).permit(:user_id, :is_leader)
    end

    def add_position_params
      params.require(:membership).permit(:position_id)
    end

end
