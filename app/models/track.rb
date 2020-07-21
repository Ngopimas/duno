class Track < ApplicationRecord
  has_many :subscriptions, dependent: :destroy
  has_many :users, through: :subscriptions
  has_many :chapters, dependent: :destroy
  belongs_to :creator, class_name: 'User'
  has_one_attached :photo

  after_create :creator_subscription

  def creator_subscription
    @track = self
    Subscription.create!(user: @track.creator, track: @track)
  end
end
