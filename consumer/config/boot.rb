require 'rubygems'
require 'bundler'

ENV['APP_ENV'] ||= 'development'

require 'active_record'
require 'active_support'

Bundler.setup
Bundler.require(:default, ENV['APP_ENV']) if defined?(Bundler)

if ENV['APP_ENV'] == 'test'
  Dotenv.load('.env.test')
else
  Dotenv.load('.env')
end

ActiveRecord::Base.establish_connection(
  adapter:  'postgis',
  host: ENV.fetch('DATABASE_HOST'),
  database: ENV.fetch('DATABASE_NAME'),
  username: ENV.fetch('DATABASE_USER'),
  password: ENV.fetch('DATABASE_PASSWORD')
)

RGeo::ActiveRecord::SpatialFactoryStore.instance.tap do |config|
  # By default, use the GEOS implementation for spatial columns.
  config.default = RGeo::Geographic.simple_mercator_factory
end

# Helpers
require_relative '../app/helpers/stream'

# Models
require_relative '../app/models/company'
require_relative '../app/models/driver'
require_relative '../app/models/field'
require_relative '../app/models/location'

# Services
require_relative '../app/services/classifier'

# Enumerations
require_relative '../app/enumerations/activity'
