class AddLatitudeAndLongitudeToPresentation < ActiveRecord::Migration
  def change
    add_column :presentations, :latitude, :float
    add_column :presentations, :longitude, :float
  end
end
