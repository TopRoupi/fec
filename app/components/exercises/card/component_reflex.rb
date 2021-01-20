# frozen_string_literal: true

class Exercises::Card::ComponentReflex < ApplicationReflex
  def do_later_list
    method = element.dataset[:method]
    exercise = Exercise.find(element.dataset[:exercise])

    if method == "add"
      @flash = "#{exercise.name} was added to you do later list"
      current_user.do_later_list.exercises << exercise
    elsif method == "remove"
      @flash = "#{exercise.name} was removed from your do later list"
      current_user.do_later_list.exercises.delete(exercise.id)
    end

    # notification = ListNotification.with(method: method.to_sym, exercise: exercise, list: current_user.do_later_list)
    # notification.deliver(current_user)
  end
end
