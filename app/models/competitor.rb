# frozen_string_literal: true

class Competitor < ApplicationRecord
  belongs_to :business
  has_many_attached :logo
  has_many_attached :picture
end
