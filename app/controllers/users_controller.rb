class UsersController < ApplicationController
def new
	if !current_user
  @user = User.new
	else
	lista = List.new
	lista.user_id = current_user.id
	redirect_to lists_path(:user => lista.user.id)
	end
end

def create
  @user = User.new(params[:user])
  if @user.save
    redirect_to root_url, :notice => "Registrado!"
  else
    render "new"
  end
end

def index
	if current_user
  @users = User.all
	else
	redirect_to log_in_path
	end
end 
end
