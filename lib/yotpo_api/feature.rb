module YotpoApi
  class Feature < OpenStruct
    def initialize(attributes)
      super(attributes)
    end

    def self.find_by_id(id)
      find(id)
    end

    def self.find_by_name(name)
      find(name)
    end

    def self.find(feature)
      response = Request.request('GET','features',"features/#{feature}")
      new (response)
    end

    def self.get_all_features
      Request.request('GET','features', 'features')
    end
  end
end