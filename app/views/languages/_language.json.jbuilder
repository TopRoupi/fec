# frozen_string_literal: true

json.extract! language, :id, :name, :cod, :created_at, :updated_at
json.url language_url(language, format: :json)
