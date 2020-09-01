class NotificationsDropdownComponent < ViewComponentReflex::Component
  def initialize(user:)
    @notifications = user.notifications
  end

  def remove_notification
    @notifications.find(element.dataset[:id].to_i).destroy
    @notifications.reload
  end
end
