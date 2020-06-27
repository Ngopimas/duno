class AddCreatorReferencesToTracks < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :tracks, :users, column: :creator_id
  end
end
