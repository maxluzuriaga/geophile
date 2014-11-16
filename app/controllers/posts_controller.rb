class PostsController < ApplicationController
  def create
    @event = Event.find_by(id: params[:event_id])

    if params[:text] != ""
      p = Post.new(text: params[:text])
      p.event = @event

      p.save
    end

    redirect_to event_path(@event)
  end
end
