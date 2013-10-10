class AddPresentationIdToSlides < ActiveRecord::Migration
  def change
  	add_column :slides, :presentation_id, :integer
  end
end
