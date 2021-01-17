# frozen_string_literal: true

class ListsModal::ComponentReflex < ApplicationReflex
  def show_modal
    exercice = Exercice.find(element.dataset[:exercice])
    @exercice_lists_modal = exercice
  end

  def add_to_list
    exercice = Exercice.find(element.dataset[:exercice])
    list = current_user.lists.find(element.dataset[:list])
    list.exercices << exercice
    @exercice_lists_modal = exercice
  end

  def remove_from_list
    exercice = Exercice.find(element.dataset[:exercice])
    list = current_user.lists.find(element.dataset[:list])
    list.exercices.delete(exercice)
    @exercice_lists_modal = exercice
  end
end
