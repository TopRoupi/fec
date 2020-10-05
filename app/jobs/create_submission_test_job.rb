class CreateSubmissionTestJob < ApplicationJob
  include CableReady::Broadcaster
  queue_as :default

  def perform(token, submission_test)
    r = Judge0.wait_response(token)

    cable_ready["application-stream"].inner_html(
      selector: "#uwu",
      html: r.to_s
    )

    cable_ready.broadcast
  end
end
