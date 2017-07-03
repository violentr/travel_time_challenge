class WelcomeController < ApplicationController

  def index
    if request.post?
      searched_area = params[:location][:name].titleize
      google_search = GoogleMapsService.new(searched_area)
      location = google_search.location
      @trip = NegotiatorTripService.new(location, Time.now)
      @route = @trip.calculate_trip
      @location = if @trip.area_is_covered?
                    GeoLocation.create_if_not_found(location)
                  else
                    location.name = "Not covered area, #{location.name}"
                    location
                  end
    end
  end
end
