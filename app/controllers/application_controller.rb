class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?
  
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  protected
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:login, :username, :email, :password, :location, :social_handles, :open_to_irl) }
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:login, :username, :email, :password, :remember_me) }
    devise_parameter_sanitizer.for(:accept_invitation).concat([:username, :open_to_irl, :location, :social_handles, :blurb, :favorite_coffee_drink])
  end



 
  def after_invite_path_for(resource)
    posts_path
  end

end
