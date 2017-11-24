class NotificationRelayJob < ApplicationJob
  queue_as :default

  # TODO: Send back js object with id and status
  # exp:
  # def perform(notification, status) ... end
  # ActionCable.server.broadcast "notifications", html: html, id: notification.id, status: {created, updated, dleted}
  #
  def perform(notification)
    html = ApplicationController.render partial: "notifications/navbar_notifications", locals: {notification: notification}, formats: [:html]
    ActionCable.server.broadcast "notifications", html: html
  end
end
