class MyEventSerializer
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

  attribute :status do |object, params|
    object.user_events.find_by(user: params[:user_id]).status
  end
end
