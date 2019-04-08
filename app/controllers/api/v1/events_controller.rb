class Api::V1::EventsController < ApplicationController
  def index
    if params[:event_type]
      render json: EventSerializer.new(Event.where(event_type: params[:event_type]))
    else
      render json: EventSerializer.new(Event.all)
    end
  end
  
  def show
    render json: EventSerializer.new(Event.find(params[:id]))
  end
end
