require File.expand_path('../config/boot', __FILE__)

data = Seeds.get

stream = Trecker::Stream.new(data)

stream.run
