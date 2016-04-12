module YotpoApi
  class User < OpenStruct
    def initialize(attributes)
      super(attributes)

    end

    def self.find(app_key)
      response = Request.request('GET','user',"users/#{app_key}")
      new (response)
    end
  end
end