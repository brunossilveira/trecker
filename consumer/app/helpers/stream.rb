module Trecker
  class Stream
    def initialize
      @client = Aws::Kinesis::Client.new(
        access_key_id: ENV.fetch('AWS_ACCESS_KEY_ID'),
        secret_access_key: ENV.fetch('AWS_SECRET_ACCESS_KEY')
      )

      set_first_shard_iterator
    end

    def run
      while true do

        get_records

        unless @records.empty?
          @records.each do |record|
            data = JSON.parse(record.data)
            puts "Classifing #{data.inspect}"

            Classifier.new(data).call
          end
        end
      end
    end

    private

    def get_records
      resp = @client.get_records({
        shard_iterator: @shard_iterator
      })

      @records = resp.records
      @shard_iterator = resp.next_shard_iterator
    end

    def set_first_shard_iterator
      resp = @client.get_shard_iterator({
        stream_name: ENV.fetch('AWS_KINESIS_STREAM_NAME'),
        shard_id: shard_id,
        shard_iterator_type: 'TRIM_HORIZON'
      })

      @shard_iterator = resp.shard_iterator
    end

    def shard_id
      resp = @client.describe_stream({
        stream_name: ENV.fetch('AWS_KINESIS_STREAM_NAME'),
        limit: 1
      })

      resp.stream_description.shards.first.shard_id
    end

    def log(response, data)
      puts "Record added. Shard ID: '#{response[:shard_id]}' (#{response[:sequence_number]}) | Data: #{data.to_json}"
    end
  end
end
