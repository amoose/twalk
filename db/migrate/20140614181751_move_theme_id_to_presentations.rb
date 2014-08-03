class MoveThemeIdToPresentations < ActiveRecord::Migration
  def change
  	remove_column :slides, :theme_id

  	add_column :presentations, :theme_id, :integer
  end
end
