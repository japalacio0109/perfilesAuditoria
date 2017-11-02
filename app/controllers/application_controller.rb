class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def profile
    if session[:data]
    else
      redirect_to login_url
    end
  end
end
