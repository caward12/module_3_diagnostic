require 'rails_helper'

describe 'nrel service' do
  context "get raw data" do
    it 'can get raw data for nearby stations' do
      VCR.use_cassette("nrel_service") do
        key = ENV['NREL_KEY']
        location = '80203'
        stations = NrelService.new(key).find_stations(location)

        expect(stations).to be_an(Array)
        expect(stations.first).to be_a(Hash)
        expect(stations.first).to have_key([:station_name])
      end
    end
  end
end