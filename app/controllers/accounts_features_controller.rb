class AccountsFeaturesController < ApplicationController
  skip_before_filter  :verify_authenticity_token
  def create
    account = YotpoApi::Account.find(params[:app_key]);
    if account
      code = 200;
      if  account.get_features.find{ |features| features['id'] == params[:feature_id].to_i }
        msg = 'Feature already enabled'
      else
        msg = 'Feature enabled successfully' if account.enable_feature(params[:feature_id])
      end
    else
      code = 401;
      msg = 'Could not find user'
    end
    render json: {:status => {:code => code, :message => msg}}

  end

  def destroy
    account = YotpoApi::Account.find(params[:app_key]);
    if account
      code = 200;
      if  account.get_features.find{ |features| features['id'] == params[:feature_id].to_i }
        msg = 'Feature disabled successfully' if account.disable_feature(params[:feature_id])
      else
        msg = 'Feature already disabled'
      end
    else
      code = 401;
      msg = 'Could not find user'
    end
    render json: {:status => {:code => code, :message => msg}}
  end

  def show
    account = YotpoApi::Account.find(params[:app_key]);
    if account
      features = account.get_features
      if features
        render json: {:status => {:code => 200, :message => 'OK'}, :response  => {:features => features} }
      else
        render json: {:status => {:code => 401, :message => 'Connection error'}}
      end
    else
      render json: {:status => {:code => 401, :message => 'Could not find user'}}
    end
  end
end
