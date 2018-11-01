class RatingsController < ApplicationController
  #   before_action :authenticate_user!

  def create
    @rating = Rating.new(rating_params)
    @rating.project_id = params[:project_id]

    respond_to do |format|
      if @rating.save
        format.html { redirect_to project_path(params[:project_id]), notice: "Thank you for helping others!" }
      else
        format.html { render :new }
      end
    end
  end

  private

  def rating_params
    params.require(:rating).permit(:rate, :testimony, :project_id)
  end
end
