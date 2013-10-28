class AddPartyIdToPartyMembers < ActiveRecord::Migration
  def change
  	add_column :party_members, :party_id, :integer
  	add_index :party_members, :party_id
  end
end
