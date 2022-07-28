# frozen_string_literal: true

class Quality < ApplicationRecord
  has_many :dimensions, dependent: :destroy

  validates :name, :thesis, :antithesis, presence: true
  validates :name, uniqueness: true
end
