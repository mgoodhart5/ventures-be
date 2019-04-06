class Api::V1::Users::EventsController < ApplicationController
  def index
    render json: MyEventSerializer.new(User.find(params[:id]).events, { params: { user_id: params[:id] } })
  end
end