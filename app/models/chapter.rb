class Chapter < ApplicationRecord
  belongs_to :track
  has_rich_text :content
end
