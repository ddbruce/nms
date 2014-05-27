class MembershipsController < ApplicationController

  def index
    @memberships = Memberships.all
  end

end
