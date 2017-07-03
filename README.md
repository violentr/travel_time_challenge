This is code implementation how to calculate route, what may
take to travel from Barbican (office) to any London area, output is
shown in minutes.

# Dependencies:
  1. Install gem httparty.
  2. Google maps api key needed to populate seed data (db/seeds.rb)
  3. Citymapper api key needed to populate seed data (db/seeds.rb)
Seeds data is specially crafted to London city.
Most of settings could be set in (config/config.yml)

  * ENV['GOOGLE_API_KEY'] (google maps api key)
  * ENV['CITYMAPER_KEY']  (citymapper api key)

  * start_point (office, by default set to Barbican)

Populate database by running:

  * rake db:create:all
  * rake db:migrate
  * rake db:seed

Run Rspec tests:
  * rspec


# Code Example:
  1. estate_agent = NegotiatorTripService.new(GeoLocation.first, Time.now)
  2. estate_agent.calculate_trip
  Will output "31"

  3. estate_agent.area_is_covered?
  Will output true

If area is not covered it will ouput the message
"this location is outside of London "
