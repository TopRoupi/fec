# frozen_string_literal: true

class Notifications::Dropdown::Component < ApplicationComponent
  def initialize(user:)
    @notifications = user.notifications.unread.reload
  end
end
