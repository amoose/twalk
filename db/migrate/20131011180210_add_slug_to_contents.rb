class AddSlugToContents < ActiveRecord::Migration
  def change
  	add_column :contents, :slug, :string
  	add_index :contents, :slug
  end
end
