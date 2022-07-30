# frozen_string_literal: true

class ScrapeSiteJob < ApplicationJob
  queue_as :default

  def perform(site)
    res = conn.get("/query") { |req| req.params["url"] = site.url }
    site.update!(data: res.body)
    site.competitors.find_each do |competitor|
      Competitors::SetSiteAnalysisJob.perform_later(competitor, site)
    end
  end

  private

  def url_for(site)
    URI.parse("http://chila-stylify.herokuapp.com/query").tap do |url|
      url.query = URI.encode_www_form(url: site.url)
    end.to_s
  end

  def scraper_url
    @scraper_url ||= "http://chila-stylify.herokuapp.com/query"
  end

  def conn
    @conn ||= Faraday.new(scraper_url) do |f|
      f.request :json # encode req bodies as JSON and automatically set the Content-Type header
      f.response :json # decode response bodies as JSON
    end
  end
end
