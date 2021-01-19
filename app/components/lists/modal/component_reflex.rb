# frozen_string_literal: true

class Lists::Modal::ComponentReflex < ApplicationReflex
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

  def create_list
    exercice = Exercice.find(element.dataset[:exercice])
    list_params = params.require(:list).permit(:name, :description, :privacy, :owner_id)
    list = List.new(list_params)
    if list.valid?
      list.exercices << exercice
      list.save
    else
      morph "#list_form", render(Lists::Modal::Form::Component.new(list: list, exercice: exercice), layout: false)
    end
  end
end
