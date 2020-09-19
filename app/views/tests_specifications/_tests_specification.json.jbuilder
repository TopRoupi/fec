# frozen_string_literal: true

json.extract! tests_specification, :id, :code, :limit_time, :limit_mem, :exercice_id, :created_at, :updated_at
json.url tests_specification_url(tests_specification, format: :json)
