# frozen_string_literal: true

json.extract! quality, :id, :created_at, :updated_at
json.url quality_url(quality, format: :json)
