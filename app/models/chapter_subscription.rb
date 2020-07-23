class ChapterSubscription < ApplicationRecord
  belongs_to :subscription
  belongs_to :chapter

  scope :read, -> { where(read: true) }
end
