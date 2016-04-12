class FeaturesController < ApplicationController
  def show
    features = YotpoApi::Feature.get_all_features
    if features
      render json: {:status => {:code => 200, :message => 'OK'}, :response  => {:features => features} }
    else
      render json: {:status => {:code => 400, :message => 'Connection error'}}
    end
  end
end
