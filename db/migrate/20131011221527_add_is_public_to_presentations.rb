class AddIsPublicToPresentations < ActiveRecord::Migration
  def change
  	add_column :presentations, :is_public, :boolean
  end
end
