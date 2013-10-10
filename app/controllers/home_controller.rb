class HomeController < ApplicationController
  def index
    @presentations = Presentation.all.order(created_at: :desc)
  end
end
