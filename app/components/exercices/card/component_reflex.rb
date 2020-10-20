# frozen_string_literal: true

class Exercices::Card::ComponentReflex < ApplicationReflex
  def do_later_list
    method = element.dataset[:method]
    exercice = Exercice.find(element.dataset[:exercice])

    if method == "add"
      current_user.do_later_list.exercices << exercice
      @flash = "#{exercice.name} was added to you do later list"
    elsif method == "remove"
      @flash = "#{exercice.name} was removed from your do later list"
      current_user.do_later_list.exercices.delete(exercice.id)
    end

    # notification = ListNotification.with(method: method.to_sym, exercice: exercice, list: current_user.do_later_list)
    # notification.deliver(current_user)
  end
end
