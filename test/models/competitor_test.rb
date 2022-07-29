# frozen_string_literal: true

require "test_helper"

class CompetitorTest < ActiveSupport::TestCase
  def competitor
    @competitor ||= competitors(:one)
  end

  test "must be valid" do
    assert_predicate competitor, :valid?
  end

  test "must allow nested attributes for site" do
    competitor = Competitor.new(name: "El Bajio", business: businesses(:one),
                                site_attributes: { url: "http://restauranteelbajio.com.mx/" })
    assert_predicate competitor, :valid?
    assert_difference "Site.count", 1 do
      competitor.save
    end
  end
end
