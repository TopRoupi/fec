class ApplicationComponent < ViewComponent::Base
  delegate :current_user, to: :helpers
  include ApplicationHelper
end
