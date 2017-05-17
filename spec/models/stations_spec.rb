require 'rails_helper'

describe "stations" do
  context "create stations" do
    it "creates stations from raw data" do
      VCR.use_cassette("stations") do
        key = ENV['NREL_KEY']
        location = '80203'
        stations = Station.stations(key, location)

        expect(stations).to be_an(Array)
        expect(stations.count).to eq(10)
        expect(stations.first).to be_a(Station)
      end
    end
  end
end