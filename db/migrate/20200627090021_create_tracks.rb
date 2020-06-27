class CreateTracks < ActiveRecord::Migration[6.0]
  def change
    create_table :tracks do |t|
      t.string :title
      t.text :description
      t.string :category
      t.string :company
      t.references :user, as :creator, null: false, foreign_key: true

      t.timestamps
    end
  end
end
