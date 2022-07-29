# frozen_string_literal: true

require "test_helper"

class BusinessTest < ActiveSupport::TestCase
  def bussines
    @bussines ||= businesses(:one)
  end

  test "mus be valid" do
    assert_predicate bussines, :valid?
  end
end
