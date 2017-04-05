class SessionController < ApplicationController
  def new
  end

  def register
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])

      session[:user_id] = user.id
      redirect_to '/'
    else
      render :register
    end
  end
  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to '/dashboard'
    else
      #redirect to failed login page?
      redirect_to '/'
    end
  end
  def destroy
    session[:user_id] = nil
    redirect_to '/'
  end
end
