class ApplicationController < ActionController::Base
  before_action :reset_cookies
  before_action :authenticate_user!
  # protect_from_forgery with: :exception

  private
    # Use callbacks to share common setup or constraints between actions.
    def reset_cookies
      if !user_signed_in?
        cookies.delete(:truck)
      end
    end
end
