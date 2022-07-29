# frozen_string_literal: true

class Dimension < ApplicationRecord
  belongs_to :dimensionable, polymorphic: true
  belongs_to :quality

  validates :value, presence: true, numericality: true

  delegate :name, :thesis, :antithesis, to: :quality, prefix: true, allow_nil: true
end
