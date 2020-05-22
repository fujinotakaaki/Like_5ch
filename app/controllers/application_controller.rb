class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_token

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit( :sign_up, keys: [ :email, :name ] )
  end

  def set_token
    session[:token] ||= SecureRandom.alphanumeric
  end
end
