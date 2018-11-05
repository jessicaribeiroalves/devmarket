class BidsController < ApplicationController
  
  def create
    @bid = Bid.new 
    @bid.project_id = params[:project_id]
    @bid.user_id = current_user.id
    @bid.save

    flash[:notice] = "Bid was successfully created"
    redirect_to root_path
  end

  def accept_bid
    @accepted_bid = Bid.find(params[:bid_id])
    @accepted_bid.status = 1
    @accepted_bid.save

    @project = Project.find(params[:project_id])
    @project.status = 1
    @project.save

    # @rejected_bids = Bid.find(:all, :conditions => { :project_id => @project.id, :status => 0 })
    # @rejected_bids.status = 2
    # @rejected_bids.save

    flash[:notice] = "Bid accepted!"
    redirect_to projects_dashboard_path
  end

end


  
 