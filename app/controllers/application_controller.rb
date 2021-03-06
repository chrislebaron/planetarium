class ApplicationController < ActionController::Base
  force_ssl if Rails.env.production?
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :user_signed_in?

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end

  private

  def authenticate_user!
 	redirect_to new_session_path, notice: "You must be signed in to continue" unless user_signed_in?
  end

  def current_user
  	@current_user ||= User.find(session[:user_id]) if session[:user_id] ## if @current_user return current user, or do after the ||=
  end

  def user_signed_in?
  	!!current_user # forces value to a boolean
  end

end
