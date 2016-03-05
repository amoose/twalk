class AddLiveTweetingToPresentations < ActiveRecord::Migration
  def change
    add_column :presentations, :live_tweeting, :boolean, default: false
  end
end
