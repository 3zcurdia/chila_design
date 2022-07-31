# frozen_string_literal: true

class Competitor < ApplicationRecord
  belongs_to :business
  belongs_to :site, optional: true
  accepts_nested_attributes_for :site, allow_destroy: false

  has_one_attached :logo do |attachable|
    attachable.variant :thumb, resize_to_limit: [150, 150]
  end
  has_one_attached :picture do |attachable|
    attachable.variant :thumb, resize_to_limit: [150, 150]
  end

  store :data, accessors: %i[site_analysis screenshot_analysis logo_analysis picture_analysis], coder: JSON

  delegate :url, to: :site, prefix: true, allow_nil: true
end
