class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user

  def is_admin?
    self.email == "admin@admin.com"
  end

  def require_login
    if current_user.nil?
      flash[:error] = "You are not permitted, please login first"
      redirect_to log_in_path
    else
      return current_user
    end
  end

  def require_admin_login
     if current_user.nil? || !current_user.is_admin?
       flash[:error] = "Only admins are permitted"
       redirect_to log_in_path
    else
       return current_user
    end
  end  

  private
  def current_user
    @current_user ||=User.find(session[:user_id]) if session[:user_id]
  end

end
