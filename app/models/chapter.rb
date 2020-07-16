class Chapter < ApplicationRecord
  belongs_to :track
  has_rich_text :content
  acts_as_list scope: :track
end
