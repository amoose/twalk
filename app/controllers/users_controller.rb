class UsersController < ApplicationController
  before_filter :authenticate_user!
  before_filter :check_admin_access, :only => [:index]
  before_filter :correct_user?, :except => [:index]

  def index
    @users = User.all
  end

  def edit
    @user = User.friendly.find(params[:id])
  end
  
  def update
    @user = User.friendly.find(params[:id])
    if @user.update_attributes(user_params)
      if session[:new_signup]
        flash[:success] = "Welcome to Twalk!"
        session.delete(:new_signup)
        redirect_to root_url 
      else
        flash[:success] = "Successfully updated your account!"
        redirect_to @user
      end
    else
      render :edit
    end
  end


  def show
    @user = User.friendly.find(params[:id])
  end

  private
    def user_params
      params.require(:user).permit(:email, :name, :geolocate_me, :image)
    end
end
