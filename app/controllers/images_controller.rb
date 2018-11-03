class ImagesController < ApplicationController
  before_action :authenticate_user!

  def create
    @image = current_user.images.create(params.require(:image).permit(:name))
    @image.save

    respond_to do |format|
      if @image.save
        format.html { redirect_to edit_user_registration_path, notice: "Image uploaded." }
      else
        format.html { render :new }
      end
    end
  end
end
