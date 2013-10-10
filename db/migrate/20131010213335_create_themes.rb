class CreateThemes < ActiveRecord::Migration
  def change
    create_table :themes do |t|
      t.string :name
      t.text :description
      t.text :mustache
      t.text :css

      t.timestamps
    end
  end
end
