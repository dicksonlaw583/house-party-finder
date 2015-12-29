class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, :if => :devise_controller?

  def page_title(title)
    @page_title = title
  end

  protected

  def configure_permitted_parameters
  	devise_parameter_sanitizer.for(:sign_up) { |u|
  		u.permit(:username, :email, :password, :password_confirmation, :first_name, :last_name, :email, :join_date, :address, :city, :province, :latitude, :longitude)
  	}
  end

  private

  def after_sign_in_path_for(resource)
    user_path(resource)
  end

  def after_update_path_for(resource)
    user_path(resource)
  end

end
