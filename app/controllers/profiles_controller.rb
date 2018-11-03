class ProfilesController < ApplicationController
  def index
    @devs = User.where("user_type = 'dev'")
  end

  def show
    @dev = User.find(params[:id])
    @images = @dev.images
    # @overall_rating = overall_rating
  end

  private

  def overall_rating
    # @dev = User.find(params[:id])
    # @overall_rating = # average total Dev's ratings
  end
end
