# frozen_string_literal: true

class Dimension < ApplicationRecord
  belongs_to :dimensionable, polymorphic: true
  belongs_to :quality

  validates :value, presence: true, numericality: true

  delegate :name, :thesis, :antithesis, to: :quality, prefix: true, allow_nil: true

  def predominant
    if value > 5.0
      quality_thesis
    elsif value < 5.0
      quality_antithesis
    end
  end
end
