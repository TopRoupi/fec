class NotificationsManagerItemComponent < ViewComponentReflex::Component
  def initialize(notification:, checked:)
    @notification = notification
    @checked = checked
  end
end
