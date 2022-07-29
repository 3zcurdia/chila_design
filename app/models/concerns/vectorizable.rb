# frozen_string_literal: true

module Vectorizable
  extend ActiveSupport::Concern

  def vector_hash
    @vector_hash ||= dimensions.pluck(:quality_id, :value).to_h
  end

  def mod2(vectorizable)
    vector_hash.map do |key, value|
      if vectorizable.vector_hash.key?(key)
        (value + vectorizable.vector_hash[key])**2
      else
        0
      end
    end.inject(&:-)
  end

  def nearest
    return @nearest if defined?(@nearest)

    font = nil
    font_max = 0
    color = nil
    color_max = 0
    Asset.find_each do |asset|
      mod2 = mod2(asset)
      if asset.type == "Font" && mod2 > font_max
        font_max = mod2
        font = asset
      elsif asset.type == "Color" && mod2 > color_max
        color_max = mod2
        color = asset
      end
    end
    @nearest = [font, color].compact
  end

  def nearest_font
    nearest.find { |x| x.type == "Font" }
  end

  def nearest_color
    nearest.find { |x| x.type == "Color" }
  end
end
