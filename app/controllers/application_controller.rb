class ApplicationController < ActionController::Base
  helper_method :current_user

  private

  def authenticate_user!
    session[:request_url] = request.original_url
    redirect_to login_path unless current_user
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user.present?
  end
end
