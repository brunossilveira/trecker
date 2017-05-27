class Seeds
  def self.get
    result = []

    ranges.each do |info|
      time = info[:start_time]

      while time < info[:end_time]
        result << { speed: info[:speed], latitude: info[:latitude], longitude: info[:longitude], timestamp: time, driver_id: 1, company_id: 1, accuracy: 12 }
        time += 30
      end
    end

    result
  end

  def self.ranges
    inside_lat = 25
    inside_long = 15

    inside_lat_2 = 20
    inside_long_2 = 10

    outside_lat = 1
    outside_long = 1

    [
      { speed: 1, latitude: inside_lat, longitude: inside_long, start_time: Time.new(2000, 10, 12, 8, 0, 0), end_time: Time.new(2000, 10, 12, 9, 0, 0) }, # Repairing
      { speed: 60, latitude: outside_lat, longitude: outside_long, start_time: Time.new(2000, 10, 12, 9, 0, 0), end_time: Time.new(2000, 10, 12, 11, 20, 0) }, # Driving
      { speed: 1, latitude: inside_lat, longitude: inside_long, start_time: Time.new(2000, 10, 12, 11, 20, 0), end_time: Time.new(2000, 10, 12, 14, 0, 0) }, # Repairing
      { speed: 20, latitude: inside_lat, longitude: inside_long, start_time: Time.new(2000, 10, 12, 14, 0, 0), end_time: Time.new(2000, 10, 12, 18, 0, 0) }, # Cultivating
      { speed: 30, latitude: outside_lat, longitude: outside_long, start_time: Time.new(2000, 10, 12, 18, 0, 0), end_time: Time.new(2000, 10, 12, 18, 1, 0) }, # Driving
      { speed: 40, latitude: inside_lat_2, longitude: inside_long_2, start_time: Time.new(2000, 10, 12, 19, 0, 0), end_time: Time.new(2000, 10, 12, 20, 11, 0) }, # Cultivating
    ]
  end
end
