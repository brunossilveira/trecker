require 'spec_helper'

RSpec.describe DailyActivitiesByDriverReport do
  describe '#perform' do
    let(:day) { Date.new(2000, 10, 12) }
    let(:driver) { Fabricate(:driver) }

    subject { described_class.new(day, driver.id) }

    context 'when there is no locations on passed date' do
      it 'processes and rows are empty' do
        subject.perform

        expect(subject.rows.count).to eq(0)
      end
    end

    context 'when there is locations on passed date' do
      context 'when vehicle spent one hour doing each of 3 tasks' do
        let(:driving_start) { Time.new(2000, 10, 12, 8, 0, 0) }
        let(:driving_end) { Time.new(2000, 10, 12, 9, 0, 0) }

        let(:cultivating_start) { Time.new(2000, 10, 12, 9, 1, 0) }
        let(:cultivating_end) { Time.new(2000, 10, 12, 10, 0, 0) }

        let(:reparing_start) { Time.new(2000, 10, 12, 10, 1, 0) }
        let(:reparing_end) { Time.new(2000, 10, 12, 11, 0, 0) }

        before do
          Fabricate(:location, timestamp: driving_start, driver: driver, activity: Activity::DRIVING)
          Fabricate(:location, timestamp: driving_end, driver: driver, activity: Activity::DRIVING)
          Fabricate(:location, timestamp: cultivating_start, driver: driver, activity: Activity::CULTIVATING)
          Fabricate(:location, timestamp: cultivating_end, driver: driver, activity: Activity::CULTIVATING)
          Fabricate(:location, timestamp: reparing_start, driver: driver, activity: Activity::REPAIRING)
          Fabricate(:location, timestamp: reparing_end, driver: driver, activity: Activity::REPAIRING)
        end

        it 'calculate report correctly' do
          subject.perform

          expect(subject.rows.count).to eq(3)
        end
      end

      context 'when vehicle spent one hour doing each of 3 tasks two times' do
        let(:driving_start) { Time.new(2000, 10, 12, 8, 0, 0) }
        let(:driving_end) { Time.new(2000, 10, 12, 9, 0, 0) }

        let(:cultivating_start) { Time.new(2000, 10, 12, 9, 1, 0) }
        let(:cultivating_end) { Time.new(2000, 10, 12, 10, 0, 0) }

        let(:reparing_start) { Time.new(2000, 10, 12, 10, 1, 0) }
        let(:reparing_end) { Time.new(2000, 10, 12, 11, 0, 0) }

        let(:driving_start_2) { Time.new(2000, 10, 12, 11, 1, 0) }
        let(:driving_end_2) { Time.new(2000, 10, 12, 12, 0, 0) }

        let(:cultivating_start_2) { Time.new(2000, 10, 12, 12, 1, 0) }
        let(:cultivating_end_2) { Time.new(2000, 10, 12, 13, 0, 0) }

        let(:reparing_start_2) { Time.new(2000, 10, 12, 13, 1, 0) }
        let(:reparing_end_2) { Time.new(2000, 10, 12, 14, 0, 0) }

        before do
          Fabricate(:location, timestamp: driving_start, driver: driver, activity: Activity::DRIVING)
          Fabricate(:location, timestamp: driving_end, driver: driver, activity: Activity::DRIVING)
          Fabricate(:location, timestamp: cultivating_start, driver: driver, activity: Activity::CULTIVATING)
          Fabricate(:location, timestamp: cultivating_end, driver: driver, activity: Activity::CULTIVATING)
          Fabricate(:location, timestamp: reparing_start, driver: driver, activity: Activity::REPAIRING)
          Fabricate(:location, timestamp: reparing_end, driver: driver, activity: Activity::REPAIRING)
          Fabricate(:location, timestamp: driving_start_2, driver: driver, activity: Activity::DRIVING)
          Fabricate(:location, timestamp: driving_end_2, driver: driver, activity: Activity::DRIVING)
          Fabricate(:location, timestamp: cultivating_start_2, driver: driver, activity: Activity::CULTIVATING)
          Fabricate(:location, timestamp: cultivating_end_2, driver: driver, activity: Activity::CULTIVATING)
          Fabricate(:location, timestamp: reparing_start_2, driver: driver, activity: Activity::REPAIRING)
          Fabricate(:location, timestamp: reparing_end_2, driver: driver, activity: Activity::REPAIRING)
        end

        it 'calculate report correctly' do
          subject.perform

          expect(subject.rows.count).to eq(6)
        end
      end
    end
  end
end
