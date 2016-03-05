class AddIndexToSlides < ActiveRecord::Migration
  def change
  	add_index :slides, :slug, unique: false
  end
end
