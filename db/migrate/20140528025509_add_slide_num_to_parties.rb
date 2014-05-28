class AddSlideNumToParties < ActiveRecord::Migration
  def change
  	add_column :parties, :slide_num, :integer
  end
end
