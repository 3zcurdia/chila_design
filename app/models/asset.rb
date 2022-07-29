# frozen_string_literal: true

class Asset < ApplicationRecord
  include Vectorizable
  has_many :dimensions, as: :dimensionable, dependent: :destroy

  validates :name, presence: true
  validates :name, uniqueness: { scope: :type }

  after_create :create_dimensions

  private

  def create_dimensions
    Quality.all.find_each do |quality|
      Dimension.create(
        dimensionable: self,
        quality: quality,
        value: 5.0
      )
    end
  end
end
