# frozen_string_literal: true

class Asset < ApplicationRecord
  include Vectorizable
  has_many :dimensions, as: :dimensionable, dependent: :destroy

  validates :name, presence: true
  validates :name, uniqueness: { scope: :type }
end
