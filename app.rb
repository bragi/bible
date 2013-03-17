# app.rb
require 'sinatra'
require 'haml'

require './passage'
require './book'

set :public_folder, File.dirname(__FILE__) + "/public"

get '/' do
  passage = Passage.new(book: params[:book] || "Gen", 
    chapter: params[:chapter] || 1,
    first: params[:first] || 1,
    last: params[:last] || nil)
  book = Book.new(params[:book] || "Gen")
  haml :index, {locals: {passage: passage, book: book}, format: :html5}
end