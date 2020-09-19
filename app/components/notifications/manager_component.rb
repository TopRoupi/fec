# frozen_string_literal: true

module Notifications
  class ManagerComponent < ViewComponentReflex::Component
    def initialize(user:)
      @m_notifications = user.notifications.newest_first
      @selected = []
    end

    def toggle_selected
      id = element.dataset[:id].to_i
      if @selected.include? id
        @selected.delete(id)
      else
        @selected << id
      end
    end

    def toggle_all_selected
      case element.dataset[:option]
      when "all"
        ids = @m_notifications.pluck(:id)
      when "read"
        ids = @m_notifications.select { |notif| notif.read? }.pluck(:id)
      when "unread"
        ids = @m_notifications.select { |notif| notif.unread? }.pluck(:id)
      end

      if ids - @selected == []
        @selected -= ids
      else
        @selected |= ids
      end
    end

    def remove_all_selected
      @m_notifications.where(id: @selected).destroy_all
      @m_notifications.reload
    end

    def mark_all_selected_as_read
      @m_notifications.where(id: @selected).mark_as_read!
      @m_notifications.reload
    end

    def mark_all_selected_as_unread
      @m_notifications.where(id: @selected).update_all(read_at: nil)
      @m_notifications.reload
    end

    def filter_by_type
      @m_notifications.where(type: element.dataset[:option]).reload
    end

    def remove_item
      @m_notifications.find(element.dataset[:id].to_i).destroy
      @m_notifications.reload
    end
  end
end
