class AddCreatorToTracks < ActiveRecord::Migration[6.0]
  def change
    add_column :tracks, :creator_id, :integer
  end
end
