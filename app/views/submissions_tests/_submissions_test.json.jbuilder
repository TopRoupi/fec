json.extract! submissions_test, :id, :submission_id, :test_id, :pass, :time_running, :output, :errors, :warnings, :mem_peak, :created_at, :updated_at
json.url submissions_test_url(submissions_test, format: :json)
