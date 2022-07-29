# frozen_string_literal: true

json.extract! dimension, :id, :created_at, :updated_at
json.url dimension_url(dimension, format: :json)
