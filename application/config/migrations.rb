require File.expand_path('../boot', __FILE__)

require_relative '../db/migrate/000_create_companies.rb'
require_relative '../db/migrate/001_create_drivers.rb'
require_relative '../db/migrate/002_create_fields.rb'
require_relative '../db/migrate/003_create_locations.rb'

CreateCompanies.up
CreateDrivers.up
CreateFields.up
CreateLocations.up
