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
    else
      json_response = {
          :status => {:code => 401, :message => 'Bad credentials'}
      }
    end
    render json: json_response
  end
end
