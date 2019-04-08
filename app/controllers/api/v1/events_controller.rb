class Api::V1::EventsController < ApplicationController
  def index
    events = Event.where(filter_params)
    if params[:month]
      month = params[:month].rjust(2, '0')
      events = events.where("start_date LIKE '#{month}%'")
    end
    render json: EventSerializer.new(events)
  end
  
  def show
    render json: EventSerializer.new(Event.find(params[:id]))
  end
  
  private
  
  def filter_params
    params.permit(:event_type, :state)
  end
end
