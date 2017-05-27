require 'spec_helper'

RSpec.describe TimeHelper do
  describe '.time_range' do
    let(:start_timestamp) { Time.new(2000, 10, 12, 8, 0, 0) }
    let(:end_timestamp) { Time.new(2000, 10, 12, 10, 0, 0) }
    let(:interval) { end_timestamp - start_timestamp }

    subject { described_class.time_range(interval) }

    it 'calculates time_range correctly' do
      expect(subject).to eq('02:00')
    end
  end
end
