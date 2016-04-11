require 'rest-client'
require 'oauth'

module YotpoApi
  class Request
    cattr_accessor :utoken, :api_url
    #Configuration method. Usage: Request.configure {|x| x.utoken = value}
    def self.configure
      yield self
    end

    #Request resource.
    #Params: req_method - type of the HTTP request - GET or POST
    #        req_type - reseource type
    #        relative_url - relative url of the resource
    def self.request(req_method, params, relative_url)
      begin
        case req_method
          when 'GET'
            response = RestClient.get "#{api_url}#{relative_url}#{relative_url[-1,1] == '&' ? '' : '?'}utoken=#{utoken}"
          when 'POST'
            return true if RestClient.post "#{api_url}#{relative_url}?utoken=#{utoken}", params
          when 'DELETE'
            return true if RestClient.delete "#{api_url}#{relative_url}?utoken=#{utoken}"
        end
        hash_response = JSON.parse(response)
        return hash_response['response'][params]
      rescue
        return false
      end
    end
  end
end

