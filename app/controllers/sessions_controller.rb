class SessionsController < ApplicationController

  def new
    redirect_to '/auth/twitter'
  end


  def create
    auth = request.env["omniauth.auth"]
    user = User.where(:provider => auth['provider'], 
                      :uid => auth['uid'].to_s).first || User.create_with_omniauth(auth)
# Reset the session after successful login, per
# 2.8 Session Fixation – Countermeasures:
# http://guides.rubyonrails.org/security.html#session-fixation-countermeasures
    reset_session
    session[:user_id] = user.id
    session[:new_signup] = true
    user.add_role :admin if User.count == 1 # make the first user an admin
    user.name = auth[:info][:name]
    user.nickname = auth[:info][:nickname]
    user.location = auth[:info][:location]
    user.image = auth[:info][:image]
    user.description = auth[:info][:description]
    if user.email.blank?
      redirect_to edit_user_path(user), :notice => "Please enter your email address."
    elsif cookies[:redirect_to]
      path = cookies[:redirect_to]
      cookies.delete(:redirect_to)
      redirect_to path, :notice => "Welcome back, #{user.name}"
    else
      redirect_to root_url, :notice => "Welcome back, #{user.name}"
    end

  end

  def destroy
    reset_session
    redirect_to root_url, :notice => 'Signed out!'
  end

  def failure
    redirect_to root_url, :alert => "Authentication error: #{params[:message].humanize}"
  end

end
