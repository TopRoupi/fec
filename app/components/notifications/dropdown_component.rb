# frozen_string_literal: true

module Notifications
  class DropdownComponent < ViewComponentReflex::Component
    def initialize(user:)
      @notifications = user.notifications.unread.reload
    end

    def read_notification
      notification = @notifications.find(element.dataset[:id].to_i)
      notification.mark_as_read!
      @notifications.reload
    end

    def read_all_notifications
      @notifications.reload
      @notifications.mark_as_read!
      @notifications.reload
    end
  end
end
