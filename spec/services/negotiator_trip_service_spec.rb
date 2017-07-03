RSpec.describe NegotiatorTripService do

  let(:location)  { create(:geo_location) }
  let(:estate_agent) { NegotiatorTripService.new(location, Time.now) }
  let(:citymaper_url) { NegotiatorTripService::BASE_URL.concat(estate_agent.api_path)}

    it "it should be initialized with params " do
      expect{NegotiatorTripService.new}.to raise_error ArgumentError
    end

    it "it should be initialized with params " do
      expect{NegotiatorTripService.new(location, Time.now)}.not_to raise_error ArgumentError
    end

    it "it should have latitude and longitude" do
      expect(estate_agent.route.latitude).to eq "51.04"
      expect(estate_agent.route.longitude).to eq "-0.34"
    end

    it "it should have destination" do
      output = "51.04,-0.34"
      expect(estate_agent.destination).to eq(output)
    end

    it "should have url for api call " do
      url = "https://developer.citymapper.com/api/1/traveltime/"
      expect(citymaper_url).to match url
    end

    it "should calculate estate_agent trip" do
      stub_request(:get, /developer.citymapper.com/).to_return(:body => "31", :status => 200, :headers => {})
      allow(estate_agent).to receive(:calculate_trip).and_return("31")
      expect(estate_agent.calculate_trip).to eq "31"
    end

  end
