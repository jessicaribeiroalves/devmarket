class RatingsController < ApplicationController
  before_action :authenticate_user!
  # TODO Authorization

  def create
    @rating = Rating.new(params.require(:rating).permit(:rate, :testimony, :project_id))
    @rating.project_id = params[:project_id]

    respond_to do |format|
      if @rating.save
        update_overall_rating
        format.html { redirect_to project_path(params[:project_id]), notice: "Thank you for helping others!" }
      else
        format.html { redirect_to project_path(params[:project_id]), notice: "Please rate your developer." }
      end
    end
  end

  private

  def update_overall_rating
    completed_projects = []
    ratings = []

    # Query for the Dev of this project
    accepted_dev = @rating.project.bids.find_by(status: 1).user_id
    dev = User.find(accepted_dev)
    # Query for the all projects the Dev was accepted
    dev_accepted_bids = dev.bids.where(status: 1)

    # Filter the query for the all projects completed by the Dev
    dev_accepted_bids.each do |bid|
      if bid.project.status == "completed"
        completed_projects.push(bid)
      end
    end

    # Filter the query for the all projects that rated the Dev
    completed_projects.each do |bid|
      if bid.project.rating != nil
        ratings.push(bid.project.rating.rate)
      end
    end
    # Calculate new overall average rating and save to User table
    updated_overall_rating = ratings.sum / ratings.size.to_f
    dev.overall_rating = updated_overall_rating
    dev.save
  end

  # def check_owner?
  #   if current_user.id == @project.user_id && :authenticate_user!
  #     true
  #   else
  #     redirect_to aroject_path(params[:project_id]), notice: "Sorry, you are not the owner of this project"
  #   end
  # end

end
