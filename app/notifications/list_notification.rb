# frozen_string_literal: true

class ListNotification < Noticed::Base
  deliver_by :database

  param :exercise, :list, :method

  def message
    case params[:method]
    when :add
      "#{params[:exercise].name} was added to you do later list"
    when :remove
      "#{params[:exercise].name} was removed from your do later list"
    end
  end
end
