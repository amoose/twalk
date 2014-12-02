class AddGeolocateMeToUsers < ActiveRecord::Migration
  def change
    add_column :users, :geolocate_me, :boolean, null: false, default: 0
  end
end
