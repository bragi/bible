# encoding: utf-8

require 'rubygems'
require 'bundler'

Bundler.require

require './app'
run Sinatra::Application
