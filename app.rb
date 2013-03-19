# app.rb
require 'sinatra'
require 'haml'

require './passage'
require './book'
require './address'

set :public_folder, File.dirname(__FILE__) + "/public"

helpers do
  def title(book)
    "#{book.passage_name} &raquo; Biblia Warszawska"
  end
end

get '/' do
  book = Book.new(params[:book], params[:chapter], params[:first], params[:last])
  haml :index, {locals: {book: book}, format: :html5}
end

get '/s/*' do |query|
  address = Address.new(query)
  book = Book.new(*address.to_params)
  haml :index, {locals: {book: book}, format: :html5}
end
