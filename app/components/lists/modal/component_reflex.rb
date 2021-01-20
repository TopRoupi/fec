# frozen_string_literal: true

class Lists::Modal::ComponentReflex < ApplicationReflex
  def show_modal
    exercise = Exercise.find(element.dataset[:exercise])
    @exercise_lists_modal = exercise
  end

  def add_to_list
    exercise = Exercise.find(element.dataset[:exercise])
    list = current_user.all_lists.find(element.dataset[:list])
    list.exercises << exercise
    @exercise_lists_modal = exercise
  end

  def remove_from_list
    exercise = Exercise.find(element.dataset[:exercise])
    list = current_user.all_lists.find(element.dataset[:list])
    list.exercises.delete(exercise)
    @exercise_lists_modal = exercise
  end

  def create_list
    exercise = Exercise.find(element.dataset[:exercise])
    list_params = params.require(:list).permit(:name, :description, :privacy, :owner_id)
    list = List.new(list_params)
    if list.valid?
      list.exercises << exercise
      list.save
    else
      morph "#list_form", render(Lists::Modal::Form::Component.new(list: list, exercise: exercise), layout: false)
    end
  end
end
