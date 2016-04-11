class AccountsController < ApplicationController
  def show
    account = YotpoApi::Account.find(params[:app_key])
    if account
      json_response = {
          :status => {:code => 200, :message => 'OK'},
          :response => {
              :app_key => account.app_key,
              :active => account.active,
              :b2b_login_url => account.get_login_url
          }
      }
      render :json => json_response
    else
      json_response = {
          :status => {:code => 401, :message => 'Could not find user'}
      }
      render json: json_response
    end
  end
end
