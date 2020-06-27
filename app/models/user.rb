class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :subscriptions
  has_many :tracks, through: :subscriptions
  has_many :track_as_creator, foreign_key: :creator_id, class_name: 'Track'
end
