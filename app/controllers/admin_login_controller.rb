class AdminLoginController < ApplicationController

  def show
    user = AdminUser.find_by(name: params[:username], password: params[:password])
    if user
      json_response = {
          :status => {:code => 200, :message => 'OK'},
          :response => {
              :username => user.name,
              :roles => user.roles.map(&:name),
          }
      }
      render :json => json_response
    else
      json_response = {
          :status => {:code => 401, :message => 'Bad credentials'}
      }
      render json: json_response
    end
  end
end
