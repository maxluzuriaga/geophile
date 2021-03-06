class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  include ApplicationHelper
  include SessionsHelper

  private

    def authenticate
      unless signed_in?
        redirect_to login_path, :notice => "Please sign in"
      end
    end
end
