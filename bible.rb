# app.rb
require 'sinatra'
require './passage'

get '/' do
  Passage.new.content()
end