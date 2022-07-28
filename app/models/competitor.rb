# frozen_string_literal: true

class Competitor < ApplicationRecord
  belongs_to :business
  has_attachment :logo
  has_attachment :picture
end
