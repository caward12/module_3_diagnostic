class SearchController < ApplicationController

  def index
    @stations = Station.stations(ENV['NREL_KEY'], params[:q])
  end
end