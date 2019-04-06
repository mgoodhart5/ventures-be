class Api::V1::UserEventsController < ApplicationController
  protect_from_forgery with: :null_session
  
  def create
    user = User.find(params[:id])
    user.user_events.create(event_id: params[:event_id].to_i)
    render json: MyEventSerializer.new(Event.find(params[:event_id]), { params: { user_id: user.id } }), status: :created
  end
  
end