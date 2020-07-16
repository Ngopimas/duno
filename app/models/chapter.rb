class Chapter < ApplicationRecord
  belongs_to :track
  acts_as_list scope: :track
end
