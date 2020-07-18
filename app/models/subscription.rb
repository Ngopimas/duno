class Subscription < ApplicationRecord
  belongs_to :user
  belongs_to :track
  has_many :chapter_subscriptions
  has_many :chapters, through: :chapter_subscriptions

  after_save :chapter_subscriptions

  def chapter_subscriptions
    @subscription = self
    @subscription.track.chapters.each do |chapter|
      ChapterSubscription.create!(subscription: @subscription, chapter: chapter)
    end
  end
end
