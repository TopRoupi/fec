# frozen_string_literal: true

module ListsHelper
  def privacy_icon(privacy, options = {})
    case privacy
    when "public_list"
      octicon("globe", options)
    when "notlisted_list"
      octicon("link", options)
    when "private_list"
      octicon("lock", options)
    end
  end
end
