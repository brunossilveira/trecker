require File.expand_path('../config/boot', __FILE__)

day = Date.parse(ARGV[0])
driver_id = ARGV[1]

report = DailyActivitiesByDriverReport.new(day, driver_id)

puts 'Running report...'
report.perform
puts 'Done'
report.print
