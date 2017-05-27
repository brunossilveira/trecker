require 'spec_helper'

RSpec.describe Classifier do
  describe '#call' do
    let(:driver) { Fabricate(:driver) }
    let!(:field) { Fabricate(:field, company: driver.company, polygon: 'POLYGON((20 10, 60 30, 20 50, 20 10))') }
    let!(:field_2) { Fabricate(:field, company: driver.company, polygon: 'POLYGON((25 15, 65 35, 20 55, 25 15))') }
    let!(:field_3) { Fabricate(:field, polygon: 'POLYGON((10 15, 45 35, 23 30, 10 15))') }

    subject { described_class.new(data).call }

    context 'when location is inside some field' do
      context 'when speed is higher than 1 km/h' do
        let(:data) do
          {
            'company_id' => driver.company.id,
            'driver_id' => driver.id,
            'timestamp' => Time.now,
            'latitude' => 30,
            'longitude' => 60,
            'accuracy' => 12.0,
            'speed' => 10
          }
        end

        it 'classifies location correctly' do
          subject

          expect(Location.first.activity).to eq(Activity::CULTIVATING)
        end
      end
    end

    context 'when speed is lower than 1 km/h' do
      let(:data) do
        {
          'company_id' => driver.company.id,
          'driver_id' => driver.id,
          'timestamp' => Time.now,
          'latitude' => 30,
          'longitude' => 60,
          'accuracy' => 12.0,
          'speed' => 0
        }
      end

      it 'classifies location correctly' do
        subject

        expect(Location.first.activity).to eq(Activity::REPAIRING)
      end
    end

    context 'when location is outside some field' do
      context 'when speed is higher than 5 km/h' do
        let(:data) do
          {
            'company_id' => driver.company.id,
            'driver_id' => driver.id,
            'timestamp' => Time.now,
            'latitude' => 99,
            'longitude' => 99,
            'accuracy' => 12.0,
            'speed' => 10
          }
        end
        it 'classifies location correctly' do
          subject

          expect(Location.first.activity).to eq(Activity::DRIVING)
        end
      end
    end
  end
end
