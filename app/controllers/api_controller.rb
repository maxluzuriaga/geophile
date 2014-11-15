class ApiController < ApplicationController
  respond_to :json

  def ping
    latitude = params[:latitude].to_f
    longitude = params[:longitude].to_f

    @events = Event.locate(latitude, longitude)
  end
end
