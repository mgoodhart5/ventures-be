class Api::V1::EventsController < ApplicationController
  def index
    if params[:event_type]
      render json: EventSerializer.new(Event.where(event_type: params[:event_type]))
    elsif params[:state]
      render json: EventSerializer.new(Event.where(state: params[:state]))
    elsif params[:month]
      month = params[:month].rjust(2, '0')
      render json: EventSerializer.new(Event.where("start_date LIKE '#{month}%'"))
    else
      render json: EventSerializer.new(Event.all)
    end
  end
  
  def show
    render json: EventSerializer.new(Event.find(params[:id]))
  end
end
