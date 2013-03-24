# coding: utf-8
require 'sinatra'
require 'haml'

require './passage'
require './book'
require './address_string'
require './address_params'

set :public_folder, File.dirname(__FILE__) + "/public"
set :raise_errors, true

configure do
  # logging is enabled by default in classic style applications,
  # so `enable :logging` is not needed
  file = File.new("#{settings.root}/log/#{settings.environment}.log", 'a+')
  file.sync = true
  $stdout.reopen(file)
  $stderr.reopen(file)
  use Rack::CommonLogger, file
end

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
  haml :index, {locals: {book: book}, format: :html5, encoding: "UTF-8"}
end
