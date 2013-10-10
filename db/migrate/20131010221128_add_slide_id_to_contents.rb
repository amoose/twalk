class AddSlideIdToContents < ActiveRecord::Migration
  def change
  	add_column :contents, :slide_id, :integer
  end
end
