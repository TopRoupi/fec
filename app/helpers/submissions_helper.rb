module SubmissionsHelper
  def render_submission(submission)
    @submission = submission
    render 'submissions/submission_results'
  end
end
