require_relative 'sinatra'
require 'minitest/autorun'
require 'rack/test'

class MyAppTest < Minitest::Test
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def test_response_http_200
    get '/'
    assert_equal 200, last_response.status
  end

  def test_response_http_200_post
    get '/'
    assert_equal 200, last_response.status
  end
end
