require 'zendesk_api'
require 'oauth2'

class AuthController < ApplicationController
  def login
    begin
      client = OAuth2::Client.new('railsapp',
        ENV['CLIENT_TOKEN'],
        site: 'https://zcckarthikcorp.zendesk.com',
        token_url: "/oauth/tokens",
        authorize_url: "/oauth/authorizations/new")

      token = client.password.get_token(params["email"], params["password"], scope: "read")
      session[:token] = token
    rescue
      redirect_to action: :show
    end
    redirect_to '/tickets'
  end

  def show
  end
end
