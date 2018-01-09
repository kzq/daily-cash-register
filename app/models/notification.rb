# frozen_string_literal: true

class Notification < ApplicationRecord
  validates :title, :body, presence: true
  #
  # TODO: Distinguish different actions
  #
  # after_create_commit :send_notification('create')
  # after_update_commit :send_notification('update')
  # after_destroy_commit :send_notification('destroy')
  #
  #   def send_notification(status)
  #     NotificationRelayJob.perform_later(self, status)
  #   end
  #
  after_commit -> { NotificationRelayJob.perform_later(self) }
end
