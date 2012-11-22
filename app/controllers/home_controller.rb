class HomeController < ApplicationController
  def index
  end
  def tomatoes
    render json: {tomatoes_done_today: current_user.today_tomatoes().length}
  end
end
