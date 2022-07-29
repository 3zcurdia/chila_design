# frozen_string_literal: true

require "test_helper"

class VectorizableTest < ActiveSupport::TestCase
  def bussines
    @bussines ||= businesses(:one)
  end

  def serif
    @serif ||= fonts(:serif)
  end

  def sansserif
    @sansserif ||= fonts(:sansserif)
  end

  def sentiment
    @sentiment ||= qualities(:sentiment)
  end

  def formality
    @formality ||= qualities(:formality)
  end

  setup do
    Dimension.create(quality: sentiment, dimensionable: bussines, value: 9.0)
    Dimension.create(quality: formality, dimensionable: bussines, value: 3.0)

    Dimension.create(quality: sentiment, dimensionable: serif, value: 5.0)
    Dimension.create(quality: formality, dimensionable: serif, value: 9.0)

    Dimension.create(quality: sentiment, dimensionable: sansserif, value: 7.5)
    Dimension.create(quality: formality, dimensionable: sansserif, value: 3.5)
  end

  test "sansserif must be the nearest font" do
    assert_equal 1, bussines.nearest.count
    assert_equal sansserif, bussines.nearest.first
  end
end
