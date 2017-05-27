class TimeHelper
  DEFAULT_TIME_FORMAT = '%H:%M'

  def self.time_range(interval)
    strftime Time.at(interval).utc
  end

  def self.strftime(time)
    time.strftime(DEFAULT_TIME_FORMAT)
  end
end
