module Trecker
  class Data
    def self.get
      {
        company_id: company_id,
        driver_id: driver_id,
        timestamp: Time.now,
        latitude: 52.234234,
        longitude: 13.23324,
        accuracy: 12.0,
        speed: speed
      }
    end

    private

    def self.speed
      [0, 4, 10].sample
    end

    def self.company_id
      [10, 20].sample
    end

    def self.driver_id
      [1,2].sample
    end
  end
end
