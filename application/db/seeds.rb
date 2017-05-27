require File.expand_path('../../config/boot', __FILE__)

company = Company.find_or_create_by(name: 'Company 1')
company_2 = Company.find_or_create_by(name: 'Company 2')
driver = Driver.find_or_create_by(name: 'Driver 1', company: company)
driver_2 = Driver.find_or_create_by(name: 'Driver 2', company: company_2)

#Location.create(driver: driver, company: company, latitude: 30, longitude: 30, activity: 'Repairing', timestamp: Time.new(2000, 10, 12, 8, 0, 0)) Location.create(driver: driver, company: company, latitude: 30, longitude: 30, activity: 'Repairing', timestamp: Time.new(2000, 10, 12, 8, 30, 0)) Location.create(driver: driver, company: company, latitude: 30, longitude: 30, activity: 'Repairing', timestamp: Time.new(2000, 10, 12, 9, 0, 0)) Location.create(driver: driver, company: company, latitude: 30, longitude: 30, activity: 'Driving', timestamp: Time.new(2000, 10, 12, 9, 30, 0)) Location.create(driver: driver, company: company, latitude: 30, longitude: 30, activity: 'Driving', timestamp: Time.new(2000, 10, 12, 10, 30, 0)) Location.create(driver: driver, company: company, latitude: 30, longitude: 30, activity: 'Driving', timestamp: Time.new(2000, 10, 12, 11, 30, 0))
#
#Location.create(driver: driver, company: company, latitude: 30, longitude: 30, activity: 'Cultivating', timestamp: Time.new(2000, 10, 12, 11, 32, 0))
#Location.create(driver: driver, company: company, latitude: 30, longitude: 30, activity: 'Cultivating', timestamp: Time.new(2000, 10, 12, 11, 55, 0))
#Location.create(driver: driver, company: company, latitude: 30, longitude: 30, activity: 'Cultivating', timestamp: Time.new(2000, 10, 12, 12, 0, 0))
#Location.create(driver: driver, company: company, latitude: 30, longitude: 30, activity: 'Cultivating', timestamp: Time.new(2000, 10, 12, 13, 0, 0))
#Location.create(driver: driver, company: company, latitude: 30, longitude: 30, activity: 'Cultivating', timestamp: Time.new(2000, 10, 12, 14, 22, 0))
#
#Location.create(driver: driver, company: company, latitude: 30, longitude: 30, activity: 'Driving', timestamp: Time.new(2000, 10, 12, 15, 00, 0))
#Location.create(driver: driver, company: company, latitude: 30, longitude: 30, activity: 'Driving', timestamp: Time.new(2000, 10, 12, 15, 30, 0))
#Location.create(driver: driver, company: company, latitude: 30, longitude: 30, activity: 'Driving', timestamp: Time.new(2000, 10, 12, 15, 44, 0))
#
#Location.create(driver: driver, company: company, latitude: 30, longitude: 30, activity: 'Repairing', timestamp: Time.new(2000, 10, 12, 16, 0, 0))
#Location.create(driver: driver, company: company, latitude: 30, longitude: 30, activity: 'Repairing', timestamp: Time.new(2000, 10, 12, 17, 30, 0))
#Location.create(driver: driver, company: company, latitude: 30, longitude: 30, activity: 'Repairing', timestamp: Time.new(2000, 10, 12, 19, 0, 0))
#
#
#Location.create(driver: driver_2, company: company_2, latitude: 30, longitude: 30, activity: 'Repairing', timestamp: Time.new(2000, 10, 12, 8, 0, 0))
#Location.create(driver: driver_2, company: company_2, latitude: 30, longitude: 30, activity: 'Repairing', timestamp: Time.new(2000, 10, 12, 8, 30, 0))
#Location.create(driver: driver_2, company: company_2, latitude: 30, longitude: 30, activity: 'Repairing', timestamp: Time.new(2000, 10, 12, 9, 0, 0))
#
#Location.create(driver: driver_2, company: company_2, latitude: 30, longitude: 30, activity: 'Driving', timestamp: Time.new(2000, 10, 12, 9, 30, 0))
#Location.create(driver: driver_2, company: company_2, latitude: 30, longitude: 30, activity: 'Driving', timestamp: Time.new(2000, 10, 12, 10, 30, 0))
#Location.create(driver: driver_2, company: company_2, latitude: 30, longitude: 30, activity: 'Driving', timestamp: Time.new(2000, 10, 12, 11, 30, 0))
#
#Location.create(driver: driver_2, company: company_2, latitude: 30, longitude: 30, activity: 'Cultivating', timestamp: Time.new(2000, 10, 12, 11, 32, 0))
#Location.create(driver: driver, company: company, latitude: 30, longitude: 30, activity: 'Cultivating', timestamp: Time.new(2000, 10, 12, 11, 55, 0))
#Location.create(driver: driver_2, company: company_2, latitude: 30, longitude: 30, activity: 'Cultivating', timestamp: Time.new(2000, 10, 12, 12, 0, 0))
#Location.create(driver: driver_2, company: company_2, latitude: 30, longitude: 30, activity: 'Cultivating', timestamp: Time.new(2000, 10, 12, 13, 0, 0))
#Location.create(driver: driver_2, company: company_2, latitude: 30, longitude: 30, activity: 'Cultivating', timestamp: Time.new(2000, 10, 12, 14, 22, 0))
#
#Location.create(driver: driver_2, company: company_2, latitude: 30, longitude: 30, activity: 'Driving', timestamp: Time.new(2000, 10, 12, 15, 00, 0))
#Location.create(driver: driver_2, company: company_2, latitude: 30, longitude: 30, activity: 'Driving', timestamp: Time.new(2000, 10, 12, 15, 30, 0))
#Location.create(driver: driver_2, company: company_2, latitude: 30, longitude: 30, activity: 'Driving', timestamp: Time.new(2000, 10, 12, 15, 44, 0))
#
#Location.create(driver: driver_2, company: company_2, latitude: 30, longitude: 30, activity: 'Repairing', timestamp: Time.new(2000, 10, 12, 16, 0, 0))
#Location.create(driver: driver_2, company: company_2, latitude: 30, longitude: 30, activity: 'Repairing', timestamp: Time.new(2000, 10, 12, 17, 30, 0))
#Location.create(driver: driver_2, company: company_2, latitude: 30, longitude: 30, activity: 'Repairing', timestamp: Time.new(2000, 10, 12, 19, 0, 0))

factory = RGeo::Geographic.simple_mercator_factory


point_1 = factory.point(1, 0)
point_2 = factory.point(1, 4)
point_3 = factory.point(-2, 0)
point_4 = factory.point(-2, 4)

line_string = factory.line_string([point_1, point_2, point_3, point_1])

poly = factory.polygon(line_string)

field = Field.find_or_create_by(name: 'Field 1')
field.polygon = poly
field.save

p = 'POLYGON((-48.6705187835693 -27.6601101847073,-48.6624506988525 -27.6684342442389,
                                      -48.6758832015991 -27.6680161559141,-48.6812905349731 -27.6616306081973,
                                      -48.6751750984192 -27.6623718069812,-48.6705187835693 -27.6601101847073))'
