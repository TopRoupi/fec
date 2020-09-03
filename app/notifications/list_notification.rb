class ListNotification < Noticed::Base
  deliver_by :database

  param :exercice, :list, :method

  def message
    case params[:method]
    when :add
      "#{params[:exercice].name} was added to you do later list"
    when :remove
      "#{params[:exercice].name} was removed from your do later list"
    end
  end
end
