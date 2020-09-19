# frozen_string_literal: true

module ExercicesHelper
  def difficult_color_class(exercice)
    case exercice.level
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
