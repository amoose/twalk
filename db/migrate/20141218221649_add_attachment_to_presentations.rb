class AddAttachmentToPresentations < ActiveRecord::Migration
  def self.up
    remove_column :presentations, :image
    add_attachment :presentations, :image
  end

  def self.down
    remove_attachment :presentations, :image
  end
end
