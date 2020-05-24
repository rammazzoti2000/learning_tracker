class LoginsController < ApplicationController
  before_action :already_logged, except: [:destroy]

  def new; end

  def create
    user = User.find_by(login_params)

    if user.nil?
      flash.now[:alert] = 'Username is not valid'
      render :new
    else
      session[:username] = user.username
      redirect_to user_url(user)
    end
  end

  def destroy
    session[:username] = nil
    redirect_to root_url
  end

  def login_params
    params.permit(:username)
  end
end
