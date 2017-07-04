module GoogleMaps

  def self.locate_area(area)
    type= APPCONFIG["google"]["type"]
    city = APPCONFIG["google"]["city"]
    google_api_key = APPCONFIG["google"]["api_key"]
    area = HTTParty.get("https://maps.googleapis.com/maps/api/geocode/#{type}?address=#{city},#{area}&key=#{google_api_key}")
  end

  def self.latitude(response)
    response["results"][0]["geometry"]["location"]["lat"]
  end

  def self.longitude(response)
    response["results"][0]["geometry"]["location"]["lng"]
  end
  def self.destination
    lat = latitude(response)
    lng = longitude(response)
    [lat, lng].join(',')
  end
end
