class AddSlugToSlides < ActiveRecord::Migration
  def change
  	add_column :slides, :slug, :string
  end
end
