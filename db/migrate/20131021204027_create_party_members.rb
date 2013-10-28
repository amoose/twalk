class CreatePartyMembers < ActiveRecord::Migration
  def change
    create_table :party_members do |t|
      t.integer :user_id
      t.integer :presentation_id
      t.string :role

      t.timestamps
    end
  end
end
