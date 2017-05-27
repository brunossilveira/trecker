require 'spec_helper'

RSpec.describe Row do
  describe '#time_interval' do
    let(:activity) { Activity::DRIVING }
    let(:start_timestamp) { Time.new(2000, 10, 12, 8, 0, 0) }
    let(:end_timestamp) { Time.new(2000, 10, 12, 10, 0, 0) }

    subject { described_class.new(activity, start_timestamp, end_timestamp).time_interval}

    it 'calculates time interval correctly' do
      expect(subject).to eq(end_timestamp - start_timestamp)
    end
  end
end
