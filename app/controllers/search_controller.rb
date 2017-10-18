  class SearchController < ApplicationController
    def index
      zip = params["q"]
      @stations = NrelService.new(zip).retrieve_stations
    end
  end
