class MembershipsController < ApplicationController

  def index
    @memberships = Membership.all
  end

  def create
    membership = Membership.new(membership_params)
    membership.organization_id = params[:organization_id]
    membership.save

    redirect_to organization_path(params[:organization_id])
  end

  def destroy
    membership = Membership.find_by_id(params[:id])

    if !membership.nil?
      membership.destroy
    end

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

end
