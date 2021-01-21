# frozen_string_literal: true

module ListsHelper
  def privacy_icon(privacy)
    case privacy
    when "public_list"
      octicon("globe", class: "align-baseline")
    when "notlisted_list"
      octicon("link", class: "align-baseline")
    when "private_list"
      octicon("lock", class: "align-baseline")
    end
  end
end
