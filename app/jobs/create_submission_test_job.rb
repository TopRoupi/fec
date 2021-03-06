# frozen_string_literal: true

class CreateSubmissionTestJob < ApplicationJob
  include CableReady::Broadcaster
  queue_as :default

  def perform(submission, testr)
    token = submission.get_test_result_token(testr)
    response = Judge0.wait_response(token)

    testr.process_state = :processed
    testr.description = response["status"]["description"]
    testr.result = response["status"]["description"] == "Accepted" ? :correct : :incorrect
    testr.time_running = response["time"]
    testr.output = response["stdout"]
    testr.code_errors = response["stderr"]
    testr.compile_output = response["compile_output"]
    testr.mem_peak = response["memory"]

    testr.save!

    testr.submission.set_result

    morph_submission_card(testr.submission)

    update_do_later_list(response, submission)
  end

  def morph_submission_card(submission)
    cable_ready["application-stream"].outer_html(
      selector: "#submission_#{submission.id}",
      html: ApplicationController.render(Submissions::ResultCard::Component.new(submission: submission), layout: false)
    )

    cable_ready.broadcast
  end

  def update_do_later_list(response, submission)
    if response["status"]["description"] == "Accepted"
      submission.user.do_later_list.exercises.delete(submission.exercise)
    end
  end
end
