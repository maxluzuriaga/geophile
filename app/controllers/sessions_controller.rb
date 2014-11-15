class SessionsController < ApplicationController
  def new
    if signed_in?
      redirect_to "/"
    end
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

    sign_in @user
    redirect_to "/"
  end

  def failure
  end

  def destroy
    sign_out
    redirect_to login_path
  end
end
