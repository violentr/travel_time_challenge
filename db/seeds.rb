# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
type= APPCONFIG["google"]["type"]
city = APPCONFIG["google"]["city"]
google_api_key = APPCONFIG["google"]["api_key"]
type_time = APPCONFIG["city_mapper"]["attributes"]["type"]
travel_list = %w(Stratford Moorgate Oval Aldgate Paddington Farringdon Euston Westminster Hoxton Whitechapel)

travel_list.each do |travel_to|
  area = HTTParty.get("https://maps.googleapis.com/maps/api/geocode/#{type}?address=#{city},#{travel_to}&key=#{google_api_key}")
  lat = area.parsed_response["results"][0]["geometry"]["location"]["lat"]
  lng = area.parsed_response["results"][0]["geometry"]["location"]["lng"]

  puts "Populating database with travel points, current record is #{travel_to}"
  GeoLocation.create(name: travel_to, latitude: lat, longitude: lng, time_type: type_time)
end

