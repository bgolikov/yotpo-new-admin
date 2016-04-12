class SessionsController < ApplicationController
  def new
  end
  def create
    user = AdminUser.find_by(name: params[:session][:text], password: params[:session][:password])
    if user
      log_in user
      redirect_to hello_world_url
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end

  end

  def destroy
  end
end
