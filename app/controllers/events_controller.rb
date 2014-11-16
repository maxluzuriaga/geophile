class EventsController < ApplicationController
  before_action :authenticate

  def index
    @old_events = @current_user.events.where("end_date < ?", Date.today)
    @future_events = @current_user.events.where("start_date > ?", Date.today)
    @current_events = @current_user.events.where("start_date <= ? AND end_date >= ?", Date.today, Date.today)
  end

  def show
    @event = Event.find_by(id: params[:id])
    # @posts = @event.posts.order(:created_at => :desc)

    if @event.user != @current_user
      redirect_to "/"
    end
  end

  def new
  end

  def create
    name = params[:name]
    start_date = params[:start_date]
    end_date = params[:end_date]
    latitude = params[:latitude].to_f
    longitude = params[:longitude].to_f
    radius = params[:radius].to_i

    if name != "" && start_date != "" && end_date != ""
      @event = Event.new({
        name: name,
        start_date: start_date,
        end_date: end_date,
        latitude: latitude,
        longitude: longitude,
        radius: radius
      })

      @event.user = @current_user
      @event.save

      redirect_to event_path(@event)
    else
      redirect_to "/new"
    end
  end
end
