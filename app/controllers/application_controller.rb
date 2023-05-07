class ApplicationController < ActionController::Base
  include SessionsHelper 
  private
  def require_user_logged_in
    unless logged_in?
      redirect_to login_url
    end
  end
  
  def correct_user
    redirect_to root_url unless current_user.admin?
  end
end
