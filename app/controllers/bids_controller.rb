class BidsController < ApplicationController
  def create

    @bid = Bid.new 
    @bid.project_id = params[:project_id]
    @bid.user_id = current_user.id
    @bid.save
    
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
  
  # Accepting a bid from dev on client's dashboard
  def accept_bid
    @accepted_bid = Bid.find(params[:bid_id])
    @accepted_bid.status = 1
    @accepted_bid.save

    # Changing the project status to 'In Progress' and setting the project deadline
    @project = Project.find(params[:project_id])
    @project.status = 1
    @project.deadline = Date.today + Product.find(@project.product_id).duration
    @project.save

    # Rejecting all other project bids
    @rejected_bids = Bid.where(:project_id => @project.id, :status => 0)
    @rejected_bids.each do |bid|
      bid.status = 2
      bid.save
    end

    # what happens on dev's dashboard when client accepts a bid ?

    flash[:notice] = "Bid accepted!"
    redirect_to projects_dashboard_path
  end
  
end
