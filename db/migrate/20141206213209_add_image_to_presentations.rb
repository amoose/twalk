class AddImageToPresentations < ActiveRecord::Migration
  def change
    add_column :presentations, :image, :text
  end
end
