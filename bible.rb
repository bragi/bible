# app.rb
require 'sinatra'
require './passage'

set :public_folder, File.dirname(__FILE__) + "/public"

get '/' do
  haml :index, {locals: {passage: Passage.new}, format: :html5}
end