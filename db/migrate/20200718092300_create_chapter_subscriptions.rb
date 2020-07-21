class CreateChapterSubscriptions < ActiveRecord::Migration[6.0]
  def change
    create_table :chapter_subscriptions do |t|
      t.references :subscription, null: false, foreign_key: true
      t.references :chapter, null: false, foreign_key: true
      t.boolean :read, null: false, default: false

      t.timestamps
    end
  end
end
