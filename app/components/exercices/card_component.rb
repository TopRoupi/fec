module Exercices
  class CardComponent < ViewComponentReflex::Component
    def initialize(exercice:, user: nil)
      @exercice = exercice
      @user = user
    end

    def do_later_list
      method = element.dataset[:method]

      if method == 'add'
        @user.do_later_list.exercices << @exercice
      elsif method == 'remove'
        @user.do_later_list.exercices.delete(@exercice.id)
      end

      notification = ListNotification.with(method: method.to_sym, exercice: @exercice, list: @user.do_later_list)
      notification.deliver(@user)

      refresh! "#{selector} #btn-do-later",'#notif-dropdown'
    end
  end
end
