class Api::V1::UserEventsController < ApplicationController
  protect_from_forgery with: :null_session

  def create
    user = User.find(params[:id])
    if params[:status] && params[:status] == 'attending'
      user.user_events.create(event_id: params[:event_id].to_i, status: 'attending')
    else
      user.user_events.create(event_id: params[:event_id].to_i)
    end
    render json: MyEventSerializer.new(Event.find(params[:event_id]), { params: { user_id: user.id } }), status: :created
  end
  
  def update
    user_event = UserEvent.find_by(user_id: params[:id], event_id: params[:event_id])
    user_event.update(user_event_params)
    render json: MyEventSerializer.new(Event.find(params[:event_id]), { params: { user_id: params[:id] } })
  end
  
  private
  
  def user_event_params
    params.permit(:status)
  end

end
