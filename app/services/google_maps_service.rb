class GoogleMapsService

  attr_reader :area

  def initialize(area)
    @area = area
  end

  def response
    ::GoogleMaps.locate_area(area)
  end

  def latitude
    ::GoogleMaps.latitude(response)
  end

  def longitude
    ::GoogleMaps.longitude(response)
  end

  def location
    OpenStruct.new({name: area, latitude: latitude, longitude: longitude})
  end
end
