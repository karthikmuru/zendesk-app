require 'zendesk_api'
require 'oauth2'

class AuthController < ApplicationController
  def login
    begin
      client = OAuth2::Client.new('railsapp',
        'ae57e6b2bef0ff19d0993a0f566f01fed35934c1201428983601b5f927cff9fe',
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
