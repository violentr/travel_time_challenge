class NegotiatorTripService
  attr_reader :route, :departure_time

  BASE_URL = "https://developer.citymapper.com/".freeze

  def initialize(route, departure_time)
    @route, @departure_time = route, departure_time
  end

  def destination
    [route.latitude, route.longitude].join(',')
  end

  def api_url(path)
     BASE_URL + path
  end

  def start_point
     "51.5200768,-0.0954517" #Barbican
  end

  def calculate_trip
    url = api_url(api_path[:travel_time]) +
     "?startcoord=#{start_point}&endcoord=#{destination}&time=#{departure_time}&time_type=arrival&key=#{ENV['CITYMAPER_KEY']}"
    if area_is_covered?
      HTTParty.get(url).parsed_response["travel_time_minutes"]
    else
      "this location is outside of London"
    end
  end

  def area_is_covered?
    url = BASE_URL + api_url(api_path[:single_point_coverage]) + "?coord=#{destination}&key=#{ENV['CITYMAPER_KEY']}"
    HTTParty.get(url).parsed_response["points"][0]["covered"]
  end

  def api_path
    {travel_time: "api/1/traveltime/", single_point_coverage: "api/1/singlepointcoverage/"}
  end
end
