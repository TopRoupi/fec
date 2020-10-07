class CreateSubmissionTestJob < ApplicationJob
  queue_as :default

  def perform(token, testr)
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
  end
end
