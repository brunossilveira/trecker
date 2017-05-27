require 'rubygems'
require 'bundler'

ENV['APP_ENV'] ||= 'development'

Bundler.setup
Bundler.require(:default, ENV['APP_ENV']) if defined?(Bundler)

Dotenv.load('../.env')

require_relative '../app/stream'
require_relative '../app/data'
