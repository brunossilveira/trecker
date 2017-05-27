require File.expand_path('../../config/boot', __FILE__)

company = Company.find_or_create_by(name: 'Company 1')
driver = Driver.find_or_create_by(name: 'Driver 1', company: company)

factory = RGeo::Geographic.simple_mercator_factory


point_1 = factory.point(10, 20)
point_2 = factory.point(30, 60)
point_3 = factory.point(50, 20)

line_string = factory.line_string([point_1, point_2, point_3, point_1])

poly = factory.polygon(line_string)

Field.find_or_create_by(name: 'Field 1', polygon: poly, company: company)

point_1 = factory.point(15, 25)
point_2 = factory.point(35, 65)
point_3 = factory.point(55, 25)

line_string = factory.line_string([point_1, point_2, point_3, point_1])

poly = factory.polygon(line_string)

Field.find_or_create_by(name: 'Field 2', polygon: poly, company: company)


Location.create(driver: driver, company: company, latitude: 30, longitude: 30, activity: 'Repairing', timestamp: Time.new(2000, 10, 12, 8, 0, 0)) Location.create(driver: driver, company: company, latitude: 30, longitude: 30, activity: 'Repairing', timestamp: Time.new(2000, 10, 12, 8, 30, 0)) Location.create(driver: driver, company: company, latitude: 30, longitude: 30, activity: 'Repairing', timestamp: Time.new(2000, 10, 12, 9, 0, 0)) Location.create(driver: driver, company: company, latitude: 30, longitude: 30, activity: 'Driving', timestamp: Time.new(2000, 10, 12, 9, 30, 0)) Location.create(driver: driver, company: company, latitude: 30, longitude: 30, activity: 'Driving', timestamp: Time.new(2000, 10, 12, 10, 30, 0)) Location.create(driver: driver, company: company, latitude: 30, longitude: 30, activity: 'Driving', timestamp: Time.new(2000, 10, 12, 11, 30, 0))

Location.create(driver: driver, company: company, latitude: 30, longitude: 30, activity: 'Cultivating', timestamp: Time.new(2000, 10, 12, 11, 32, 0))
Location.create(driver: driver, company: company, latitude: 30, longitude: 30, activity: 'Cultivating', timestamp: Time.new(2000, 10, 12, 11, 55, 0))
Location.create(driver: driver, company: company, latitude: 30, longitude: 30, activity: 'Cultivating', timestamp: Time.new(2000, 10, 12, 12, 0, 0))
Location.create(driver: driver, company: company, latitude: 30, longitude: 30, activity: 'Cultivating', timestamp: Time.new(2000, 10, 12, 13, 0, 0))
Location.create(driver: driver, company: company, latitude: 30, longitude: 30, activity: 'Cultivating', timestamp: Time.new(2000, 10, 12, 14, 22, 0))

Location.create(driver: driver, company: company, latitude: 30, longitude: 30, activity: 'Driving', timestamp: Time.new(2000, 10, 12, 15, 00, 0))
Location.create(driver: driver, company: company, latitude: 30, longitude: 30, activity: 'Driving', timestamp: Time.new(2000, 10, 12, 15, 30, 0))
Location.create(driver: driver, company: company, latitude: 30, longitude: 30, activity: 'Driving', timestamp: Time.new(2000, 10, 12, 15, 44, 0))

Location.create(driver: driver, company: company, latitude: 30, longitude: 30, activity: 'Repairing', timestamp: Time.new(2000, 10, 12, 16, 0, 0))
Location.create(driver: driver, company: company, latitude: 30, longitude: 30, activity: 'Repairing', timestamp: Time.new(2000, 10, 12, 17, 30, 0))
Location.create(driver: driver, company: company, latitude: 30, longitude: 30, activity: 'Repairing', timestamp: Time.new(2000, 10, 12, 19, 0, 0))


Location.create(driver: driver_2, company: company_2, latitude: 30, longitude: 30, activity: 'Repairing', timestamp: Time.new(2000, 10, 12, 8, 0, 0))
Location.create(driver: driver_2, company: company_2, latitude: 30, longitude: 30, activity: 'Repairing', timestamp: Time.new(2000, 10, 12, 8, 30, 0))
Location.create(driver: driver_2, company: company_2, latitude: 30, longitude: 30, activity: 'Repairing', timestamp: Time.new(2000, 10, 12, 9, 0, 0))

Location.create(driver: driver_2, company: company_2, latitude: 30, longitude: 30, activity: 'Driving', timestamp: Time.new(2000, 10, 12, 9, 30, 0))
Location.create(driver: driver_2, company: company_2, latitude: 30, longitude: 30, activity: 'Driving', timestamp: Time.new(2000, 10, 12, 10, 30, 0))
Location.create(driver: driver_2, company: company_2, latitude: 30, longitude: 30, activity: 'Driving', timestamp: Time.new(2000, 10, 12, 11, 30, 0))

Location.create(driver: driver_2, company: company_2, latitude: 30, longitude: 30, activity: 'Cultivating', timestamp: Time.new(2000, 10, 12, 11, 32, 0))
Location.create(driver: driver, company: company, latitude: 30, longitude: 30, activity: 'Cultivating', timestamp: Time.new(2000, 10, 12, 11, 55, 0))
Location.create(driver: driver_2, company: company_2, latitude: 30, longitude: 30, activity: 'Cultivating', timestamp: Time.new(2000, 10, 12, 12, 0, 0))
Location.create(driver: driver_2, company: company_2, latitude: 30, longitude: 30, activity: 'Cultivating', timestamp: Time.new(2000, 10, 12, 13, 0, 0))
Location.create(driver: driver_2, company: company_2, latitude: 30, longitude: 30, activity: 'Cultivating', timestamp: Time.new(2000, 10, 12, 14, 22, 0))

Location.create(driver: driver_2, company: company_2, latitude: 30, longitude: 30, activity: 'Driving', timestamp: Time.new(2000, 10, 12, 15, 00, 0))
Location.create(driver: driver_2, company: company_2, latitude: 30, longitude: 30, activity: 'Driving', timestamp: Time.new(2000, 10, 12, 15, 30, 0))
Location.create(driver: driver_2, company: company_2, latitude: 30, longitude: 30, activity: 'Driving', timestamp: Time.new(2000, 10, 12, 15, 44, 0))

Location.create(driver: driver_2, company: company_2, latitude: 30, longitude: 30, activity: 'Repairing', timestamp: Time.new(2000, 10, 12, 16, 0, 0))
Location.create(driver: driver_2, company: company_2, latitude: 30, longitude: 30, activity: 'Repairing', timestamp: Time.new(2000, 10, 12, 17, 30, 0))
Location.create(driver: driver_2, company: company_2, latitude: 30, longitude: 30, activity: 'Repairing', timestamp: Time.new(2000, 10, 12, 19, 0, 0))
