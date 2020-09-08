class DoLaterListReflex < ApplicationReflex
  def add_exercice
    exercice = Exercice.find(element.dataset[:id].to_i)
    current_user.do_later_list.exercices << exercice
    notification = ListNotification.with(method: :add, exercice: exercice, list: current_user.do_later_list)
    notification.deliver(current_user)
  end

  def kek
    @user.validate
  end

  def remove_exercice
    exercice = Exercice.find(element.dataset[:id].to_i)
    current_user.do_later_list.exercices.delete(exercice.id)
    notification = ListNotification.with(method: :remove, exercice: exercice, list: current_user.do_later_list)
    notification.deliver(current_user)
  end
end
