class UsersController < ApplicationController
  def new
  @user = User.new
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
  @users = User.all
end 
end
