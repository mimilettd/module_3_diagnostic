  class SearchController < ApplicationController
    def index
      zip = params["q"]
      @conn = Faraday.new(url: "https://developer.nrel.gov/") do |faraday|
        faraday.adapter  Faraday.default_adapter
      end

      response = @conn.get("https://developer.nrel.gov/api/alt-fuel-stations/v1/nearest.json?api_key=#{ENV['api_key']}&fuel_type=LPG,ELEC&location=#{zip}&radius=6")
      raw_data = JSON.parse(response.body, symbolize_names: true)[:fuel_stations]

      @stations = raw_data.map do |object|
        Station.new(object)
      end
    end
  end
