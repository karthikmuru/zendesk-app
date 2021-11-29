require 'zendesk_api'
require 'uri'
require 'net/http'
require 'json'
require 'dotenv/load'

class ApplicationController < ActionController::Base

  BASE_URL = "https://zcckarthikcorp.zendesk.com"

  private

  def make_request(url)
    https = Net::HTTP.new(url.host, url.port)
    https.use_ssl = true

    request = Net::HTTP::Get.new(url)
    request["Authorization"] = "Bearer " + ENV['API_TOKEN']
    https.request(request)
  end

  def request_and_handle_error(url)
    url = URI(url)
    response = make_request(url)
    @code = response.code
    @response_body = JSON.parse(response.read_body)
    @error = @response_body['error']
    render :template => 'error/show', :status => @code if @code != '200'
  end

end
