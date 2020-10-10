# frozen_string_literal: true

class Submissions::Ide::CodeEditorComponent < ViewComponentReflex::Component
  def initialize(submission:, exercice:)
    @exercice = exercice
    @code = submission.code if submission
    @language = submission.language_id if submission
    @selected_tab = :input
    @tabs = %I[input output compiler_output]
    @run_state = "stopped"
  end

  def run
    sub = Judge0::Submission.new { |config|
      submission = params["submission"]
      config.source_code = submission["code"]
      config.language_id = Language.find(submission["language_id"]).cod
      config.stdin = params["input"]
    }

    @run_state = "running"
    refresh! "#run-button"

    sub.run

    @run_state = "stopped"
    @output = sub.output
    @compiler_output = sub.compile_out
    @selected_tab = :output
    refresh! "#bottom"
  end
end
