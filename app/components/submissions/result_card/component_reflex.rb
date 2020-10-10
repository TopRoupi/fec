# frozen_string_literal: true

class Submissions::ResultCard::ComponentReflex < ApplicationReflex
  def remove
    current_user.submissions.find(element.dataset[:submission]).destroy
  end
end
