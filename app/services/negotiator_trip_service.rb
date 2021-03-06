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
    APPCONFIG["city_mapper"]["attributes"]["start_point"] #Barbican
  end

  def citymaper_api_key
    APPCONFIG['city_mapper']['api_key'] || (raise NegotiatorTripService::CityMapperMissingApiKey.new)
  end

  def calculate_trip
    url = api_url(api_path[:travel_time]) +
     "?startcoord=#{start_point}&endcoord=#{destination}&time=#{departure_time}&time_type=arrival&key=#{citymaper_api_key}"
    if area_is_covered?
      HTTParty.get(url).parsed_response["travel_time_minutes"]
    else
      "this location is outside of London"
    end
  end

  def area_is_covered?
    url = api_url(api_path[:single_point_coverage]) + "?coord=#{destination}&key=#{citymaper_api_key}"
    HTTParty.get(url).parsed_response["points"][0]["covered"]
  end

  def api_path
    {travel_time: "api/1/traveltime/", single_point_coverage: "api/1/singlepointcoverage/"}
  end

  class CityMapperMissingApiKey < StandardError; end
end
