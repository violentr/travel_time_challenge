RSpec.describe GoogleMapsService do
  let(:location)  { create(:geo_location) }
  let(:google_search) { GoogleMapsService.new(location.name) }

  it "it should be initialized with params " do
    expect{GoogleMapsService.new}.to raise_error ArgumentError
  end

  it "it should be initialized with params " do
    expect{GoogleMapsService.new(location.name)}.not_to raise_error ArgumentError
  end

  it "it should have location name, latitude and longitude" do
    stub_request(:get, /maps.googleapis.com/).to_return(:body => location.latitude.to_s, :status => 200, :headers => {})
    allow(google_search).to receive(:location).and_return(location)
    expect(google_search.location.name).to eq(location.name)
    expect(google_search.location.latitude).to eq(location.latitude)
    expect(google_search.location.longitude).to eq(location.longitude)
  end
end
