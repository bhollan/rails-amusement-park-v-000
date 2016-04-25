class SessionsController < ApplicationController
  def create
    session[:user_id] = params[:user][:id]
    redirect_to user_path(current_user)
  end

  def logout
    session.clear
    redirect_to root_path
  end
end
