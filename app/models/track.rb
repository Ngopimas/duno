class Track < ApplicationRecord
  has_many :subscriptions
  has_many :users, through: :subscriptions
  belongs_to :creator, class_name: 'User'
end
