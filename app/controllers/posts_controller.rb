class PostsController < ApplicationController
  before_action :authenticate

  def create
    @event = Event.find_by(id: params[:event_id])

    if params[:text] != "" && @event.user == @current_user
      p = Post.new(text: params[:text])
      p.event = @event

      p.save
    end

    redirect_to event_path(@event)
  end
end
