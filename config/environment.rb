
ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../../Gemfile', __FILE__)

require 'bundler/setup' if File.exists?(ENV['BUNDLE_GEMFILE'])

require 'rubygems'

require 'dotenv'
Dotenv.load

require 'uri'
require 'pathname'

require 'pg'
require 'active_record'
require 'logger'

require 'sinatra'
require "sinatra/reloader" if development?

require 'erb'

require 'sinatra/cross_origin'
require 'json'
require 'rest-client'
require 'pry'
require 'rb-readline'
require 'sinatra/activerecord'


# Some helper constants for path-centric logic
APP_ROOT = Pathname.new(File.expand_path('../../', __FILE__))

APP_NAME = APP_ROOT.basename.to_s

configure do
  #set root path manually
  set :root, APP_ROOT.to_path

  enable :sessions
  set :session_secret, ENV['SESSION_SECRET'] || 'this is a secret shhhhh'

  enable :cross_origin

  #setting views
  set :views, File.join(Sinatra::Application.root, "app", "views")
end

# setting helpers and controllers
Dir[APP_ROOT.join('app', 'controllers', '*.rb')].each { |file| require file }
Dir[APP_ROOT.join('app', 'helpers', '*.rb')].each { |file| require file }

# set up the database and models
require APP_ROOT.join('config', 'database')
