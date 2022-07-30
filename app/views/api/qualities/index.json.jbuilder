# frozen_string_literal: true

json.array! @qualities, partial: "/api/qualities/quality", as: :quality
