class SearchController < ApplicationController

  def index
    response = Faraday.get "http://api.data.gov/nrel/alt-fuel-stations/v1/nearest.json?location=#{params[:q]}&radius=6.0&fuel_types=ELEC,LPG&limit=10&api_key=#{ENV['NREL_KEY']}"
    parsed = JSON.parse(response.body, symbolize_names: true)
    @stations = parsed[:fuel_stations]
  end
end