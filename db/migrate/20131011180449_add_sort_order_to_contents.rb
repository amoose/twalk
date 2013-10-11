class AddSortOrderToContents < ActiveRecord::Migration
  def change
  	add_column :contents, :sort_order, :integer
  end
end
