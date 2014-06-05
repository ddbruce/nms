class MembershipsController < ApplicationController

  def index
    @memberships = Membership.all
  end

end
