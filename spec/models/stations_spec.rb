require 'rails_helper'

describe "stations" do
  context "create stations" do
    it "creates stations from raw data" do
      VCR.use_cassette("stations") do
        key = ENV['NREL_KEY']
        stations = Stations.stations(key)

        expect(stations.count).to eq(10)
      end
    end
  end
end