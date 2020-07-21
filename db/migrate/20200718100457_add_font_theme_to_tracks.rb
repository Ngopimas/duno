class AddFontThemeToTracks < ActiveRecord::Migration[6.0]
  def change
    add_column :tracks, :font_theme, :string
  end
end
