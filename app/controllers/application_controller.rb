class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :require_auth
  helper_method :current_user
  helper_method :user_signed_in?
  helper_method :correct_user?
  helper_method :current_user_latlon
  helper_method :check_admin_access
  include Mercury::Authentication
  
  private
    def current_user
      begin
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
      rescue Exception => e
        nil
      end
    end

    def user_signed_in?
      return true if current_user
    end

    def correct_user?
      @user = User.friendly.find(params[:id])
      unless current_user == @user or current_user.has_role? :admin
        access_denied
      end
    end

    def check_admin_access
      unless current_user and current_user.has_role? :admin
        access_denied
      end
    end

    def authenticate_user!
      if !current_user
        access_denied
      end
    end

    def current_user_latlon
      session[:geolocation] ? "#{session[:geolocation][:latitude]},#{session[:geolocation][:longitude]}" : nil
    end

    def access_denied
      redirect_to root_url, :alert => "Access denied."
    end

    def require_auth
      unless user_signed_in?
        cookies[:redirect_to] = "/#{request.fullpath}"
        redirect_to signin_path, :notice => 'You must be logged in to do that.'
      end
    end
    
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :alert => exception.message
  end

end
