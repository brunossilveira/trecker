class DailyActivitiesByDriverReport < BaseReport
  attr_reader :driver_id, :day, :rows

  def initialize(day, driver_id)
    @driver_id = driver_id
    @day = day
    @rows = []
  end

  def perform
    return unless locations.count > 0

    activity = locations.first.activity
    current_timestamp = locations.first.timestamp

    row = Row.new(activity, current_timestamp)

    locations.each do |location|

      if activity_changed?(activity, location.activity) || last_location?(location)
        activity = location.activity
        end_timestamp = current_timestamp
        row.end_timestamp = end_timestamp
        rows << row

        row = Row.new(activity, location.timestamp)
      end

      current_timestamp = location.timestamp
    end
  end

  def title
    "Driver: #{driver.name} | Day: #{day.strftime('%Y/%m/%d')}"
  end

  def headings
    %w(From To Activity Total)
  end

  private

  def locations
    @locations ||= Location.where(driver: driver, timestamp: date_range).order(timestamp: :asc)
  end

  def driver
    @driver ||= Driver.find(driver_id)
  end

  def activity_changed?(source, target)
    source != target
  end

  def last_location?(location)
    location.equal?(locations.last)
  end

  def date_range
    day.beginning_of_day..day.end_of_day
  end
end
