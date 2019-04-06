class Api::V1::Users::EventsController < ApplicationController
  def index
    render json: EventSerializer.new(User.find(params[:id]).events)
  end
end