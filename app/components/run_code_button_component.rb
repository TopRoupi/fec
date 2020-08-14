class RunCodeButtonComponent < ViewComponentReflex::Component
  def initialize
    @state = 'stopped'
  end
  
  def run
    @state = 'running'
    refresh! '.editor'
    sub = Judge0::Submission.new do |config|
      config.source_code = @code
      config.language_id = 72
    end
    sub.run
    @output = sub.stdout
    @state = 'ready'
    refresh! '.editor', selector
  end
end
