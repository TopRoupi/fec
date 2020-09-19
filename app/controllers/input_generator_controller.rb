# frozen_string_literal: true

class InputGeneratorController < ApplicationController
  def index
    @languages = Language.all
  end
end
