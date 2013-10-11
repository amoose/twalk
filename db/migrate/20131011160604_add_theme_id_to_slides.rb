class AddThemeIdToSlides < ActiveRecord::Migration
  def change
  	add_column :slides, :theme_id, :integer
  end
end
