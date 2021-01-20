# frozen_string_literal: true

json.extract! exercise, :id, :category_id, :language_id, :name, :level, :content, :code, :limit_time, :limit_mem, :created_at, :updated_at
json.url exercise_url(exercise, format: :json)
