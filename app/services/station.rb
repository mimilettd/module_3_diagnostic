class Station
  def initialize(attrs = {})
    @name = attrs[:station_name]
    @street = attrs[:street_address]
    @city = attrs[:city]
    @state = attrs[:state]
    @zip = attrs[:zip]
    @fuel_type = attrs[:fuel_type_code]
    @distance = attrs[:distance]
    @access_times = attrs[:access_days_time]
  end
end
