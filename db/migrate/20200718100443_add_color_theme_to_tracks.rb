class AddColorThemeToTracks < ActiveRecord::Migration[6.0]
  def change
    add_column :tracks, :color_theme, :string
  end
end
