json.extract! list, :id, :name, :description, :privacy, :owner_id, :created_at, :updated_at
json.url list_url(list, format: :json)
