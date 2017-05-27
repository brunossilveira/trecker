class Classifier
  attr_reader :driver_id, :location

  INSIDE_FIELD_SPEED_LIMIT = 1
  OUTSIDE_FIELD_SPEED_LIMIT = 5

  def initialize(data)
    @driver_id = data['driver_id']
    data.delete(:accuracy)
    data.delete('accuracy')
    @location = Location.new(data)
  end

  def call
    if driver
      fields.each do |field|
        break if classify(field)
      end

      location.save
    end
  end

  private

  def classify(field)
    result = false

    if inside_field?(field) &&
        crossed_limit?(INSIDE_FIELD_SPEED_LIMIT)
      location.activity = Activity::CULTIVATING
      result = true
    elsif inside_field?(field)
      location.activity = Activity::REPAIRING
      result = true
    elsif crossed_limit?(OUTSIDE_FIELD_SPEED_LIMIT)
      location.activity = Activity::DRIVING
      result = true
    end

    result
  end

  def fields
    @fields ||= Field.where(company: driver.company)
  end

  def inside_field?(field)
    field.polygon.intersects?(location.location)
  end

  def driver
    @driver ||= Driver.find_by_id(driver_id)
  end

  def crossed_limit?(threshold)
    location.speed > threshold
  end
end
