class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(roll: params[:session][:roll])
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to user
    else
      flash.now[:danger] = 'Invalid roll number/password combination'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
