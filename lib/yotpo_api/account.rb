module YotpoApi
  class Account < OpenStruct
    def initialize(attributes)
      super(attributes)

    end

    def self.find(app_key)
      response = Request.request('GET','app',"apps/#{app_key}")
      new (response) unless response == false
    end

    #Returns an array of features
    def get_features
      Request.request('GET', 'features', "apps/#{self.app_key}/features")
    end

    #Enables a given feature id
    def enable_feature(feature_id)
      Request.request('POST',{'id': feature_id}, "apps/#{self.app_key}/features" )
    end

    #Disables a given feature id
    def disable_feature(feature_id)
      Request.request('DELETE', '', "apps/#{self.app_key}/features/#{feature_id}")
    end

    #Returns login url
    def get_login_url
      Request.request('GET', 'signin_url', "users/b2blogin.json?app_key=#{self.app_key}&secret=#{self.secret}&")
    end
  end
end