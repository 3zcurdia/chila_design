# frozen_string_literal: true

json.array! @dimensions, partial: "/api/dimensions/dimension", as: :dimension
