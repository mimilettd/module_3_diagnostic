class NrelService
  def initialize(zip)
    @zip = zip

    @conn = Faraday.new(url: "https://developer.nrel.gov/") do |faraday|
      faraday.adapter  Faraday.default_adapter
    end
  end

  def retrieve_stations
    response = @conn.get("https://developer.nrel.gov/api/alt-fuel-stations/v1/nearest.json?api_key=#{ENV['api_key']}&fuel_type=LPG,ELEC&location=#{@zip}&radius=6&limit=10")
    raw_data = JSON.parse(response.body, symbolize_names: true)[:fuel_stations]

    raw_data.map do |object|
      Station.new(object)
    end
  end
end
