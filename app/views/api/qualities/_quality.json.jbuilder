# frozen_string_literal: true

json.extract! quality, :id, :created_at, :updated_at
json.from quality.antithesis
json.to quality.thesis
