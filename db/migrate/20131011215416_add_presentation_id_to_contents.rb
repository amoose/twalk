class AddPresentationIdToContents < ActiveRecord::Migration
  def change
  	add_column :contents, :presentation_id, :integer
  end
end
