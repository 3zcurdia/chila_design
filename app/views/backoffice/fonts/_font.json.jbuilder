# frozen_string_literal: true

json.extract! font, :id, :created_at, :updated_at
json.url font_url(font, format: :json)
