class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # call the config params
  before_action :configure_permitted_parameters, if: :devise_controller?
  #protect db
  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :email, :password, :password_confirmation, :remeber_me])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:username, :email, :password, :password_confirmation, :remeber_me]) 
    devise_parameter_sanitizer.permit(:account_update, keys: [:email, :password, :password_confirmation, :remeber_me])
  end

end
