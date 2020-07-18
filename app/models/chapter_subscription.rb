class ChapterSubscription < ApplicationRecord
  belongs_to :subscription, dependent: :destroy
  belongs_to :chapter, dependent: :destroy

  scope :read, -> { where(read: true) }
end
