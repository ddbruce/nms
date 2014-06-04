class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def dashboard
    @user = User.find(params[:id])
    @memberships = @user.memberships
    @organizations = @user.organizations
  end

  def show
  end

  def new
  end

  def created
  end

  def update
  end

  def destroy
  end
  
end
