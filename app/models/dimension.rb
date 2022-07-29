# frozen_string_literal: true

class Dimension < ApplicationRecord
  belongs_to :dimensionable, polymorphic: true
  belongs_to :quality

  validates :value, presence: true, numericality: true
end
