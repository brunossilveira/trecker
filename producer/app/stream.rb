module Trecker
  class Stream
    DEFAULT_SLEEP_TIME_IN_SECONDS = 1

    def initialize(data)
      @data = data
      @client = Aws::Kinesis::Client.new(
        access_key_id: ENV.fetch('AWS_ACCESS_KEY_ID'),
        secret_access_key: ENV.fetch('AWS_SECRET_ACCESS_KEY')
      )
    end

    def put(data)
      @client.put_record({
        stream_name: ENV.fetch('AWS_KINESIS_STREAM_NAME'),
        data: data.to_json,
        partition_key: data[:driver_id].to_s
      })
    end


    def run
      @data.each do |data|
        response = put(data)
        log(response, data)

        sleep DEFAULT_SLEEP_TIME_IN_SECONDS
      end
    end

    private

    def log(response, data)
      puts "Record added. Shard ID: '#{response[:shard_id]}' (#{response[:sequence_number]}) | Data: #{data.to_json}"
    end
  end
end
