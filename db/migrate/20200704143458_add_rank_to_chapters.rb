class AddRankToChapters < ActiveRecord::Migration[6.0]
  def change
    add_column :chapters, :rank, :integer
  end
end
