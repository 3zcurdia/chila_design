# frozen_string_literal: true

class Industry < ApplicationRecord
  has_many :businesses, dependent: :nullify
end
