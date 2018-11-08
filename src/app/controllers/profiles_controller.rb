class ProfilesController < ApplicationController
  
# Max. number of profiles per page is 24

  def index
    @devs = User.where("user_type = 'dev'").order(updated_at: "desc").limit(24)
  end

# Showing ratings for each dev (ratings provided by client) 

  def show
    @dev = User.find(params[:id])
    @ratings = RatingService::get_ratings(@dev)
  end
end
