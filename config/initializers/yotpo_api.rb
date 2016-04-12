YotpoApi::Request.configure do |conf|
  conf.utoken = ENV['TOKEN']
  conf.api_url = ENV['URL']
end