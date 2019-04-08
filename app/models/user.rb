class User < ApplicationRecord

  validates_presence_of :name, :email, :image_url, :bio

  has_many :user_events, dependent: :destroy
  has_many :events, through: :user_events
  
  has_one_attached :image
end
