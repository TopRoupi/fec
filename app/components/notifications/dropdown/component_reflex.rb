# frozen_string_literal: true

class Notifications::Dropdown::ComponentReflex < ApplicationReflex
  def read_notification
    notification = current_user.notifications.unread.find(element.dataset[:id].to_i)
    notification.mark_as_read!
  end

  def read_all_notifications
    current_user.notifications.unread.mark_as_read!
  end
end
