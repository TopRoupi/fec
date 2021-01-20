# frozen_string_literal: true

module ExercisesHelper
  def difficult_color_class(exercise)
    case exercise.level
    when 0..2
      "success"
    when 3..4
      "warning"
    else
      "danger"
    end
  end

  def resolved_percentage_color(percentage)
    if percentage < 5
      "danger"
    elsif percentage < 50
      "warning"
    else
      "success"
    end
  end
end
