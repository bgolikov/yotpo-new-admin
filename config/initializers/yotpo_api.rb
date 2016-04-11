YotpoApi::Request.configure do |conf|
  conf.utoken = ENV['token']
  conf.api_url = ENV['url']
end