require 'rails_helper'

RSpec.describe GeoLocation, type: :model do
  let(:location) { create(:geo_location) }
  it {is_expected.to respond_to(:latitude) }
  it {is_expected.to respond_to(:longitude) }
  it {is_expected.to respond_to(:time_type) }
  it {is_expected.to respond_to(:name) }
  it {is_expected.to respond_to(:travel_time_minutes) }

  it "should create record if not found " do
    expect(GeoLocation.create_if_not_found(location)).to eq(location)
  end
end
