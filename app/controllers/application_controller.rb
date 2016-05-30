class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?

def current_user
  @current_user ||= Cheff.find(session[:cheff_id]) if session[:cheff_id]
end

def logged_in?
  !!current_user
end

def require_user
 if !logged_in? || !current_user.admin?
 	flash[:danger] = "You must logged in to perform the action"
 	redirect_to root_path
end

end
end
