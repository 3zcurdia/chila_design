# frozen_string_literal: true

require "test_helper"

class UserTest < ActiveSupport::TestCase
  def user
    @user ||= users(:one)
  end

  test "must be valid" do
    assert_predicate user, :valid?
  end
end
