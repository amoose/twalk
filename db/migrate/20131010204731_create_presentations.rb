class CreatePresentations < ActiveRecord::Migration
  def change
    create_table :presentations do |t|
      t.string :name
      t.string :slug
      t.text :description

      t.timestamps
    end

    add_index :presentations, :slug, unique: false
    add_index :users, :nickname, unique: true
  end
end
