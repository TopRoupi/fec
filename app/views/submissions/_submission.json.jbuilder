json.extract! submission, :id, :code, :user_id, :language_id, :exercice_id, :created_at, :updated_at
json.url submission_url(submission, format: :json)
