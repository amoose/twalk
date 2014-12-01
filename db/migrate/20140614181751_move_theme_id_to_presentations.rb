class MoveThemeIdToPresentations < ActiveRecord::Migration
  def change
  	add_column :presentations, :theme_id, :integer
  end
end
