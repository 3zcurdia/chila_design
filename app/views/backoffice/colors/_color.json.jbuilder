# frozen_string_literal: true

json.extract! color, :id, :created_at, :updated_at
json.url color_url(color, format: :json)
