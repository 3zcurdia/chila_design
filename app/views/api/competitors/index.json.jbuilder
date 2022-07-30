# frozen_string_literal: true

json.array! @competitors, partial: "/api/competitors/competitor", as: :competitor
