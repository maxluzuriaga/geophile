class SessionsController < ApplicationController
  def new
  end

  def create
  	auth = request.env['omniauth.auth']

  	@user = User.find_by(provider: auth.provider, uid: auth.uid)
  	unless @user
      @user = User.create!({
      	name: auth.info.name,
      	email: auth.info.email,
      	provider: auth.provider,
      	uid: auth.uid
      })
    end

    redirect_to "/"
  end

  def failure
  end

  def destroy
    sign_out
    redirect_to login_path
  end
end
