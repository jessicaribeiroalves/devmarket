class BidsController < ApplicationController
  def create
    # To place a bid - user must a dev and not already have a bid
    if current_user.user_type == "dev" && current_user.bids.find_by(:project_id => params[:project_id]) == nil
      @bid = Bid.new
      @bid.project_id = params[:project_id]
      @bid.user_id = current_user.id
      @bid.save

      flash[:notice] = "Bid was successfully created"
      redirect_to project_path(params[:project_id])
    else
      flash[:notice] = "You already made a bid on this project"
      redirect_to project_path(params[:project_id])
    end
  end
end
