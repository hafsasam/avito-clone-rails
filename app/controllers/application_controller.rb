class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper

  private
    def authenticate
      unless logged_in?
        flash[:danger] = "Merci de se connecter"
        redirect_to login_url
      end
    end

end
