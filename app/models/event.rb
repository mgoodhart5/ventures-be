class Event < ApplicationRecord
  validates_presence_of :name,
                        :city,
                        :state,
                        :event_type,
                        :start_date,
                        :end_date
  
  has_many :user_events
  has_many :users, through: :user_events
end
