# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # Require authentication for all requests. Add
  # skip_before_action :authenticate_user! to controllers that should not
  # require authentication.
  before_action :authenticate_user!, unless: :devise_controller?
  before_action :retrieve_recent_notifications, if: :user_signed_in?

  layout :set_layout

  private

    # Choose from 2 types of layouts: guest (not logged-in), user
    def set_layout
      user_signed_in? ? "user" : "guest"
    end

  protected

    def after_sign_in_path_for(resource)
      stored_location_for(resource) || root_path
    end

    def stored_location_for(resource)
      store_location_for(resource, user_path(resource))
    end

    def retrieve_recent_notifications
      @recent_notifications = Notification.order("created_at desc").limit(20)
    end
end
