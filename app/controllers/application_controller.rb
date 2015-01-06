class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def authorize_user
    unless !current_user.nil? && current_user.admin?
      redirect_to root_url, notice: "You must be an admin to view that page."
    end
  end
end
