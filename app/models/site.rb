# frozen_string_literal: true

class Site < ApplicationRecord
  has_many :competitors, dependent: :nullify

  has_one_attached :screenshot do |attachable|
    attachable.variant :thumb, resize_to_limit: [150, 150]
    attachable.variant :brand, resize_to_fill: [256, 256], gravity: "NorthWest"
  end

  validates :url, presence: true, uniqueness: true

  after_create :scrape_site, if: -> { url_changed? || data.blank? }

  def analysis
    {
      sentiment: sentiment,
      colors: colors,
      typographies: typographies,
      background_colors: background_colors,
      text_colors: text_colors
    }
  end

  def sentiment
    return @sentiment if defined?(@sentiment)

    @sentiment = Hash.new { 0 }
    colors.each do |hex, value|
      color = Color.find_or_create_by(value: hex) { |clr| clr.name = hex }
      color.dimensions.each do |dim|
        predominant = dim.predominant
        next if predominant.nil?

        @sentiment[predominant] += value
      end
    end

    typographies.each do |name, value|
      font = Font.find_or_create_by(name: name)
      font.dimensions.each do |dim|
        predominant = dim.predominant
        next if predominant.nil?

        @sentiment[predominant] += value
      end
    end
    @sentiment
  end

  def colors
    return @colors if defined?(@colors)

    @colors = Hash.new { 0 }
    background_colors.each do |hex, value|
      @colors[hex] += value
    end
    text_colors.each do |hex, value|
      @colors[hex] += value
    end
    @colors
  end

  def background_colors
    data.fetch("coloursBg", []).to_h
  end

  def text_colors
    data.fetch("coloursText", []).to_h
  end

  def typographies
    return @typographies if defined?(@typographies)

    @typographies = Hash.new { 0 }
    data.fetch("typography", []).each do |div, data|
      next if data["font"] == "N/A" || data["font"].blank?

      @typographies[data["font"]] += div_weight(div)
    end
    @typographies
  end

  private

  def div_weight(div)
    case div
    when "h1" then 7
    when "h2" then 6
    when "h3" then 5
    when "h4" then 4
    when "h5" then 3
    when "h6" then 2
    when "h7", "body" then 1
    else
      0
    end
  end

  def scrape_site
    ScrapeSiteJob.perform_later(self)
  end
end
