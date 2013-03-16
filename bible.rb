# app.rb
require 'sinatra'
require './passage'
require 'haml'

set :public_folder, File.dirname(__FILE__) + "/public"

get '/' do
  passage = Passage.new(book: params[:book] || "Gen", 
    chapter: params[:chapter] || 1,
    first: params[:first] || 1,
    last: params[:last] || nil)
  haml :index, {locals: {passage: passage}, format: :html5}
end