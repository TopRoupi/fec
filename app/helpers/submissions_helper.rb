# frozen_string_literal: true

module SubmissionsHelper
  def result_class(result)
    case result
    when "correct"
      "subm-correct"
    when "incorrect"
      "subm-incorrect"
    else
      "bg-light"
    end
  end
end
