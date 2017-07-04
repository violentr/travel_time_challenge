RSpec.describe GoogleMaps do
  let(:location)  { create(:geo_location) }
  let(:searched_area) { GoogleMapsService.locate_area(location.name) }

  it "it should have latitude and longitude" do
    output = {"results" => [{"geometry" => {"location" => { "lat" => location.latitude, "lng" => location.longitude}}}]}
    stub_request(:get, /maps.googleapis.com/).to_return(:body => output.to_json, :status => 200, :headers => {})
    allow(GoogleMaps).to receive(:locate_area).and_return(output)
    expect(GoogleMaps.latitude(output)).to eq(location.latitude)
    expect(GoogleMaps.longitude(output)).to eq(location.longitude)
  end
end
