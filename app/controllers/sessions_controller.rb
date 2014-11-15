class SessionsController < ApplicationController
  def new
  end

  def create
  	auth = request.env['omniauth.auth']

  	puts auth['info']

  	render :text => auth.inspect
  end

  def failure
  end
end
