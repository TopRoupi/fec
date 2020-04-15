class InputGeneratorController < ApplicationController
  def index
  	@languages = Language.all
  end
end
