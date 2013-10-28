class AddNameToParties < ActiveRecord::Migration
  def change
  	add_column :parties, :name, :string
  	add_column :parties, :slug, :string
  end
end
