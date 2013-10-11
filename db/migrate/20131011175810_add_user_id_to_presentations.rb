class AddUserIdToPresentations < ActiveRecord::Migration
  def change
  	add_column :presentations, :user_id, :integer
  	add_index :presentations, :user_id
  end
end
