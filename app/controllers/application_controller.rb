class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  MODALITY_FORM = ["duration", "check_in", "keys", "petsitting", "transportation", "others"]

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:company_id, :first_name, :last_name, :bio, :job, :seniority])
    devise_parameter_sanitizer.permit(:account_update, keys: [:company_id, :first_name, :last_name, :bio, :job, :seniority])
  end

end
