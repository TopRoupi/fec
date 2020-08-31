# To deliver this notification:
#
# ListNotification.with(post: @post).deliver_later(current_user)
# ListNotification.with(post: @post).deliver(current_user)

class ListNotification < Noticed::Base
  # Add your delivery methods
  #
  deliver_by :database
  # deliver_by :email, mailer: "UserMailer"
  # deliver_by :slack
  # deliver_by :custom, class: "MyDeliveryMethod"

  # Add required params
  #
  param :exercice, :list, :method

  # Define helper methods to make rendering easier.
  #
  def message
    case params[:params][:method]
    when :add
      "#{params[:params][:exercice].name} was added to you do later list"
    when :remove
      "#{params[:params][:exercice].name} was removed from your do later list"
    end
  end
  #
  # def url
  #   post_path(params[:post])
  # end
end
