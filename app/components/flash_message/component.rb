# frozen_string_literal: true

class FlashMessage::Component < ApplicationComponent
  def initialize(message:, css_class:)
    @message = message
    @class = css_class
  end
end
