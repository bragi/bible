# encoding: utf-8

require 'rubygems'
require 'bundler'

Bundle.require

require './app'
run Sinatra::Application
