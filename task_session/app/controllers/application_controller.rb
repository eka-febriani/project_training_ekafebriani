class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user

  def require_login
    if current_user.nil?
      flash[:error] = "You are not permitted, please login first"
      redirect_to log_in_path
    else
      return current_user
    end
  end

 def able_edit_delete_article?
    if(@article.user_id == current_user.id || current_user.is_admin?)
    else
      flash[:notice] = 'Have no autorize to do this!'
      redirect_to articles_path
    end
 end

 rescue_from NoMethodError, :with => :record_not_found

  private
    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def record_not_found
      render "/public/404.html", :status => 404, :layout => false
    end

end
