# frozen_string_literal: true

class Site < ApplicationRecord
  has_many :competitors, dependent: :nullify
  validates :url, presence: true, uniqueness: true
end
