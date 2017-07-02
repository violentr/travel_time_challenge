class CreateGeoLocations< ActiveRecord::Migration[5.1]
  def change
    create_table :geo_locations do |t|
      t.text :latitude
      t.text :longitude
      t.text :time_type
      t.text :name
      t.text :travel_time_minutes
      t.timestamps
    end
  end
end
