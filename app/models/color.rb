# frozen_string_literal: true

class Color < Asset
  validates :value, presence: true
end
