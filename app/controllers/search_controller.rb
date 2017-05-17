class SearchController < ApplicationController

  def index
    response = Faraday.get "http://api.data.gov/nrel/alt-fuel-stations/v1"
  end
end