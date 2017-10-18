  class SearchController < ApplicationController
    def index
      @stations = NRELService.new(zipcode).retrieve_stations
    end
  end
