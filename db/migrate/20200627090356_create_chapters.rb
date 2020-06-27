class CreateChapters < ActiveRecord::Migration[6.0]
  def change
    create_table :chapters do |t|
      t.references :track, null: false, foreign_key: true
      t.string :title
      t.text :content

      t.timestamps
    end
  end
end
