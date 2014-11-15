class EventsController < ApplicationController
  before_action :authenticate

  def index
    @old_events = @current_user.events.where("end_date < ?", Date.today)
    @future_events = @current_user.events.where("start_date > ?", Date.today)
    @current_events = @current_user.events.where("start_date <= ? AND end_date >= ?", Date.today, Date.today)
  end

  def show
    @event = Event.find_by(id: params[:id])

    if @event.user != @current_user
      redirect_to "/"
    end
  end

  def new
  end

  def create
  end
end
