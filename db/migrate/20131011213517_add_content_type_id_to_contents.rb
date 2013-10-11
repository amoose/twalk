class AddContentTypeIdToContents < ActiveRecord::Migration
  def change
  	add_column :contents, :content_type_id, :integer
  end
end
