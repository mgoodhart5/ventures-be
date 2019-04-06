class User < ApplicationRecord

  validates_presence_of :name, :email, :image_url, :bio

  has_many :user_events
  has_many :events, through: :user_events
end
