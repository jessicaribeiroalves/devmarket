class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:user_type])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :company_name, :bio, :city, :phone_number, :avatar])
  end


end
