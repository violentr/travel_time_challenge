require 'rails_helper'

RSpec.describe GeoLocation, type: :model do
  it {is_expected.to respond_to(:latitude) }
  it {is_expected.to respond_to(:longitude) }
  it {is_expected.to respond_to(:time_type) }
  it {is_expected.to respond_to(:name) }
  it {is_expected.to respond_to(:travel_time_minutes) }
end
