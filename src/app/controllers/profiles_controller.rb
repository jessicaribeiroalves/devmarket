class ProfilesController < ApplicationController
  def index
    @devs = User.where("user_type = 'dev'").order(updated_at: "desc").limit(24)
  end

  def show
    @dev = User.find(params[:id])
    @ratings = RatingService::get_ratings(@dev)
  end
end
