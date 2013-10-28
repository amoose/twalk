class HomeController < ApplicationController
	before_action :set_presentations

  def index
  end

  private
  	def set_presentations
  		@presentations = Presentation.all.order(created_at: :desc)
    	@nearby_presentations = Presentation.near(current_user_latlon)
    	# @my_presentations = Presentation.where(:user_id => current_user.id) if user_signed_in?
    	@my_presentations = Presentation.for(current_user.id) if user_signed_in?
  	end
end
