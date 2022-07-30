# frozen_string_literal: true

class Competitor < ApplicationRecord
  belongs_to :business
  belongs_to :site, optional: true
  accepts_nested_attributes_for :site, allow_destroy: false, reject_if: ->(attrs) { attrs["url"].blank? }

  has_one_attached :logo do |attachable|
    attachable.variant :thumb, resize_to_limit: [150, 150]
  end
  has_one_attached :picture do |attachable|
    attachable.variant :thumb, resize_to_limit: [150, 150]
  end

  delegate :url, :data, to: :site, prefix: true, allow_nil: true
end
