# frozen_string_literal: true

class Business < ApplicationRecord
  belongs_to :industry, optional: true
  has_many :dimensions, as: :dimensionable, dependent: :destroy
  has_many :competitors, dependent: :destroy

  validates :name, presence: true
end
