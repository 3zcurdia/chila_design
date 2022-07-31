# frozen_string_literal: true

json.extract! competitor, :id, :business_id, :site_url, :created_at, :updated_at
json.analysis do
  json.site competitor.site_analysis if competitor.site_analysis.present?
end
