class Track < ApplicationRecord
  has_many :subscriptions, dependent: :destroy
  has_many :users, through: :subscriptions
  has_many :chapters, dependent: :destroy
  belongs_to :creator, class_name: 'User'
end
