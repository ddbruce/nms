class OrganizationsController < ApplicationController

  def index
    @organizations = Organizations.all
  end

end
