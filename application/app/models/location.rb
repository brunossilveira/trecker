class Location < ActiveRecord::Base
  FACTORY = RGeo::Geographic.simple_mercator_factory

  belongs_to :driver
  belongs_to :company

  def latitude=(latitude)
    self.location = FACTORY.point(location ? location.longitude : 0, latitude)
  end

  def longitude=(longitude)
    self.location = FACTORY.point(longitude, location ? location.latitude : 0)
  end

  def latitude
    location.latitude if location
  end

  def longitude
    location.longitude if location
  end
end
