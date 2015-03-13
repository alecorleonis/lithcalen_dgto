class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

helper_method :current_user
helper_method :current_list

private

def current_user
  @current_user ||= User.find(session[:user_id]) if session[:user_id]
end

private
def current_list
@current_list = params[:list_id]
end
end
