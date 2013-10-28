class CreateParties < ActiveRecord::Migration
  def change
    create_table :parties do |t|
      t.integer :presentation_id

      t.timestamps
    end
  end
end
