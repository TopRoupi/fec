class InputGeneratorComponent < ViewComponentReflex::Component
  def initialize(languages:)
    @languages = languages
  end

  def handle_lang_change
    @lang = element.value
  end
  
   def handle_code_change
    @code = element.value
  end
end
