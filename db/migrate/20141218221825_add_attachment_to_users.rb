class AddAttachmentToUsers < ActiveRecord::Migration
  def self.up
    remove_column :users, :image
    add_attachment :users, :image
  end

  def self.down
    remove_attachment :users, :image
  end
end


