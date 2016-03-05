class AddHashtagToPresentations < ActiveRecord::Migration
  def change
    add_column :presentations, :hashtag, :string
    add_index :presentations, :hashtag, unique: false
  end
end
