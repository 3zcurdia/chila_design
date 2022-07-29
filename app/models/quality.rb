# frozen_string_literal: true

class Quality < ApplicationRecord
  has_many :dimensions, dependent: :destroy

  validates :thesis, :antithesis, presence: true
end
