class SessionsController < ApplicationController
  def new
  end

def create
  user = User.authenticate(params[:email], params[:password])
  if user
    session[:user_id] = user.id
    redirect_to lists_path(:user => user.id), :notice => "Conectado!"
  else
    flash.now.alert = "Correo o contrasena incorrecta"
    render "new"
  end
end

def destroy
  session[:user_id] = nil
  redirect_to root_url, :notice => "Sesion cerrada!"
end
end
