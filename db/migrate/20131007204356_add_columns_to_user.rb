class AddColumnsToUser < ActiveRecord::Migration
  def change
  	add_column :users, :nickname, :string
  	add_column :users, :location, :string
  	add_column :users, :image, :string
  	add_column :users, :description, :text
  end
end
