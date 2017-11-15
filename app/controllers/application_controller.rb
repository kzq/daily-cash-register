class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # Require authentication for all requests. Add
  # skip_before_action :authenticate_user! to controllers that should not
  # require authentication.
  before_action :authenticate_user!, unless: :devise_controller?

  layout :set_layout

  private

  # Choose from 2 types of layouts: guest (not logged-in), user
  def set_layout
    user_signed_in? ? 'user' : 'guest'
  end

end
