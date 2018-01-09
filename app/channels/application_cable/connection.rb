# frozen_string_literal: true

module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    # prevent users from connecting to the websockets
    # without a user account logged in
    def connect
      self.current_user = find_verfied_user
    end

    protected

      def find_verfied_user
        if current_user = env["warden"].user
          current_user
        else
          reject_unauthorized_connection
        end
      end
  end
end
