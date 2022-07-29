# frozen_string_literal: true

class Competitor < ApplicationRecord
  belongs_to :business
  belongs_to :site, optional: true
  has_many_attached :logo
  has_many_attached :picture
  accepts_nested_attributes_for :site, allow_destroy: false, reject_if: ->(attrs) { attrs["url"].blank? }

  delegate :url, :data, to: :site, prefix: true, allow_nil: true
end
