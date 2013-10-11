class AddIndexToSlides < ActiveRecord::Migration
  def change
  	add_index :slides, :slug
  end
end
