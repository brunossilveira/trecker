class Row
  attr_reader :activity, :start_timestamp
  attr_accessor :end_timestamp

  def initialize(activity, start_timestamp, end_timestamp = nil)
    @activity = activity
    @start_timestamp = start_timestamp
    @end_timestamp = end_timestamp
  end

  def time_interval
    end_timestamp - start_timestamp
  end

  def table_row
    [
      TimeHelper.strftime(start_timestamp),
      TimeHelper.strftime(end_timestamp),
      activity,
      TimeHelper.time_range(time_interval)
    ]
  end
end
