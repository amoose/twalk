class AddSortOrderToSlides < ActiveRecord::Migration
  def change
  	add_column :slides, :sort_order, :integer
  end
end
