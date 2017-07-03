class NegotiatorTripService
  attr_reader :route, :departure_time

  BASE_URL = "https://developer.citymapper.com/"

  def initialize(route, departure_time)
    @route, @departure_time = route, departure_time
  end

  def destination
    [route.latitude, route.longitude].join(',')
  end

  def calculate_trip
    start_coord = "51.5200768,-0.0954517" #Barbican
    byebug
    url = BASE_URL.concat(api_path).concat(
      "?startcoord=#{start_coord}&endcoord=#{destination}&time=#{departure_time}&time_type=arrival&key=#{ENV['CITYMAPER_KEY']}")
    HTTParty.get(url).parsed_response["travel_time_minutes"]
  end

  def api_path
     "api/1/traveltime/"
  end
end
