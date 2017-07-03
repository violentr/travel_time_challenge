class GeoLocation< ApplicationRecord

  def self.create_if_not_found(location)
    if find_by(name: location.name)
      location.name
    else
      location = create(name: location.name, latitude: location.latitude, longitude: location.longitude)
    end
    location
  end
end
