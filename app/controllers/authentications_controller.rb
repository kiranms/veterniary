class AuthenticationsController < ApplicationController

  def new
    redirect_to users_path if session[:current_user]
  end

  def create
    @current_user = User.authenticate_user(params[:auth_params])

    if params[:auth_params] && @current_user
      session[:current_user] = @current_user.id
      flash[:success] = 'Successfully logged in'
      redirect_to users_path
    else
      flash[:error] = 'Please check credentials'
      redirect_to new_authentication_path
    end
  end

  def destroy
    session[:current_user] = nil
    redirect_to new_authentication_path
  end

end