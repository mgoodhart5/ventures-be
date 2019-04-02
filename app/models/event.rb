class Event < ApplicationRecord
  validates_presence_of :name,
                        :city,
                        :state,
                        :type,
                        :start_date,
                        :end_date
end
