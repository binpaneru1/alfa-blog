class SessionsController < ApplicationController

  def new
  end

  def create
    if session_user && user_authenticate?
      session[:user_id] = session_user.id
      flash[:notice] = "Logged in sucessfully"
      redirect_to session_user
    else
      flash.now[:alert] = "There was something wrong with your login details!"
      render 'new'
    end 
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "logged out"
    redirect_to root_path
  end

  @private

  def session_params
    params.require[:sessions].permit[:email, :password]
  end

  def session_user
     User.find_by(email: params[:session][:email].downcase)
  end

  def user_authenticate?
    return true if session_user.authenticate(params[:session][:password])
  end
end