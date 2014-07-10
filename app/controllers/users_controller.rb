class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def dashboard
    @user = User.find(params[:user_id])
    @memberships = Membership.where(user_id: @user.id, approval_status: 1)
    @articles = Article.where(user_id: @user.id) 
  end

  def nms_config_options
    @nms_config_basic = NmsConfig.where(requires_admin: false)
    @nms_config_admin = NmsConfig.where(requires_admin: true)
  end

  def show
  end

  def new
  end

  def created
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update_attributes(user_params)
    redirect_to user_dashboard_path(@user)
  end

  def destroy
  end

  private
    def user_params 
       params.require(:user).permit(:email, :fname, :lname, :RIN, :year)
    end
  
end
