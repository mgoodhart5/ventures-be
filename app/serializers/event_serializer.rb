class EventSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name,
             :city,
             :state,
             :event_type,
             :price,
             :start_date,
             :end_date,
             :description,
             :event_url,
             :image_url,
             :video_url
end
