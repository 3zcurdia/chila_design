# frozen_string_literal: true

class Site < ApplicationRecord
  has_many :competitors, dependent: :nullify
  validates :url, presence: true, uniqueness: true

  has_one_attached :screenshot do |attachable|
    attachable.variant :thumb, resize_to_limit: [150, 150]
    attachable.variant :brand, resize_to_fill: [256, 256], gravity: "NorthWest"
  end
end
