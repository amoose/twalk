class AddGeolocationUpdatedAtToPresentations < ActiveRecord::Migration
  def change
  	add_column :presentations, :geolocation_updated_at, :datetime
  	add_column :presentations, :geolocation_accuracy, :integer
  end
end
