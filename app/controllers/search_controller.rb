  class SearchController < ApplicationController
    def index
      @conn = Faraday.new(url: "https://developer.nrel.gov/") do |faraday|
        faraday.adapter  Faraday.default_adapter
      end

      response = @conn.get("api/alt-fuel-stations/v1.json?api_key=#{ENV['api_key']}&fuel_type=LPG,ELEC&zip=80203")
      raw_data = JSON.parse(response.body, symbolize_names: true)
      binding.pry
    end
  end
