class ProfilesController < ApplicationController
  before_action :set_dev, only: [:show, :list_ratings]

  def index
    @devs = User.where("user_type = 'dev'")
  end

  def show
    @images = @dev.images # portfolio images
    @overall_rating = @dev.overall_rating
    @ratings = list_ratings
  end

  private

  def set_dev
    @dev = User.find(params[:id])
  end

  def list_ratings
    completed_projects = []
    @ratings = []

    # Query for the all projects the Dev was accepted
    dev_accepted_bids = @dev.bids.where(status: 1)
    # Filter the query for the all projects completed by the Dev
    dev_accepted_bids.each do |bid|
      if bid.project.status == "completed"
        completed_projects.push(bid)
      end
    end
    # Filter the query for the all projects that rated the Dev
    completed_projects.each do |bid|
      if bid.project.rating != nil
        @ratings.push(bid.project.rating)
      end
    end
    @ratings
  end
end
