# frozen_string_literal: true

require "test_helper"

class DimensionTest < ActiveSupport::TestCase
  def bussines
    @bussines ||= businesses(:one)
  end

  def quality
    @quality ||= qualities(:sentiment)
  end

  def dimension
    @dimension ||= Dimension.new(quality: quality, dimensionable: bussines, value: 6.5)
  end

  test "mus be valid" do
    assert_predicate dimension, :valid?
  end
end
