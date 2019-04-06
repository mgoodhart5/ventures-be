class Api::V1::EventsController < ApplicationController
  def index
    render json: EventSerializer.new(Event.all)
  end
  
  def show
    render json: EventSerializer.new(Event.find(params[:id]))
  end
end
