# encoding: utf-8
Encoding.default_external = Encoding::UTF_8
Encoding.default_internal = Encoding::UTF_8

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
  file = File.new("#{settings.root}/log/#{settings.environment}.log", 'w')
  file.sync = true
  if settings.environment == "production"
    $stdout.reopen(file)
    $stderr.reopen(file)
  end
  use Rack::CommonLogger, file
end

helpers do
  def title(book)
    "#{book.passage_name} &raquo; Biblia Warszawska"
  end
end

before do
  content_type :html, 'charset' => 'utf-8'
end

get "/" do
  redirect to("/#{AddressParams.new(params).to_s}")
end

get "/*" do |query|
  address = AddressString.new(query)
  book = Book.new(*address.to_params)
  haml :index, {locals: {book: book}, format: :html5, encoding: "UTF-8"}
end
