class BidsController < ApplicationController
  
  def create
    @bid = Bid.new 
    @bid.project_id = params[:project_id]
    @bid.user_id = current_user.id
    @bid.save

    flash[:notice] = "Bid was successfully created"
    redirect_to root_path
  end



 - not a bid twice


end


  
 