require 'zendesk_api'
require 'uri'
require 'net/http'
require 'json'

class ApplicationController < ActionController::Base

  BASE_URL = "https://zcckarthikcorp.zendesk.com"
  TOKEN = "f4f55a3b7261770c0e8f76bee558a7e67566febd83a2c33eeb1e99da78f409ba"

  def make_request(url)
    https = Net::HTTP.new(url.host, url.port)
    https.use_ssl = true

    request = Net::HTTP::Get.new(url)
    request["Authorization"] = "Bearer " + TOKEN
    https.request(request)
  end

  # def error_handle(request)
  #   code = request.code
  #   return if code == "200"
    
    
  # end

end
