# encoding: utf-8
require 'minitest/autorun'
require 'rack/test'
require File.expand_path('../app', File.dirname(__FILE__))

set :environment, :test

class AppTest < MiniTest::Unit::TestCase

  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def test_redirect_from_root_to_book
    get "/"
    assert last_response.redirect?
    assert_equal "http://example.org/Gen" , last_response.location 
  end

  def test_redirect_from_root_to_book_with_params
    get "/", {book: "J", chapter: "11", verses: "35-45"}
    assert last_response.redirect?
    assert_equal "http://example.org/J11:35-45" , last_response.location 
  end
end
