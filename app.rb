# app.rb
require 'sinatra'
require 'haml'

require './passage'
require './book'
require './address_string'
require './address_params'

set :public_folder, File.dirname(__FILE__) + "/public"

helpers do
  def title(book)
    "#{book.passage_name} &raquo; Biblia Warszawska"
  end
end

get "/" do
  redirect to("/#{AddressParams.new(params).to_s}")
end

get "/*" do |query|
  address = AddressString.new(query)
  book = Book.new(*address.to_params)
  haml :index, {locals: {book: book}, format: :html5}
end
