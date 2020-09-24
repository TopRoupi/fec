# frozen_string_literal: true
class Submissions::Ide::CodeEditorComponent < ViewComponentReflex::Component
  def initialize(submission:, languages:)
    @submission = submission
    @languages = languages
    @selected_tab = :input
    @tabs = %I{input output compiler_output language}
    @run_state = 'stopped'
  end

  def run
    sub = Judge0::Submission.new do |config|
      config.source_code = params["code"]
      config.language_id = params["language"]
      config.stdin = params["input"]
    end

    @run_state = "running"
    refresh! "#run-button"

    sub.run

    @run_state = "ready"
    @output = sub.output
    @selected_tab = :output
    refresh! "#bottom"

    sleep(2)
    @run_state = "stopped"
    refresh! "#run-button"
  end
end
