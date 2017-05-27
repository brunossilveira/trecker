class Company < ActiveRecord::Base
  has_many :drivers
  has_many :fields
end
