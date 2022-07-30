# frozen_string_literal: true

json.array! @businesses, partial: "/api/businesses/business", as: :business
