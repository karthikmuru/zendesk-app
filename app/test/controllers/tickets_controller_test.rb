require "test_helper"
require 'webmock'

class TicketsControllerTest < ActionDispatch::IntegrationTest


  test "should get index" do
  end

  test "should get show" do
    get tickets_show_url
    assert_response :success
  end
end
