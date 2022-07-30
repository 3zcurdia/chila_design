# frozen_string_literal: true

require "csv"

["food & beberage"].each do |name|
  Industry.find_or_create_by(name: name)
end

[
  { thesis: "Professional", antithesis: "Casual" },
  { thesis: "Fun", antithesis: "Informative" },
  { thesis: "Enthusiastic", antithesis: "Serious" },
  { thesis: "Upbeat", antithesis: "Calm" },
  { thesis: "Nostalgic", antithesis: "Modern" }
].each do |quality|
  Quality.find_or_create_by(quality)
end

CSV.open(Rails.root.join("config/pantones.csv"), headers: true).each do |row|
  Color.find_or_create_by(name: row["name"]) do |col|
    col.value = row["hex"]
  end
end

[
  {
    name: "Raleway, sans-serif",
    dimensions: [
      { quality_thesis: "Professional", value: 0.1e2 },
      { quality_thesis: "Fun", value: 0.1e1 },
      { quality_thesis: "Enthusiastic", value: 0.2e1 },
      { quality_thesis: "Upbeat", value: 0.4e1 },
      { quality_thesis: "Nostalgic", value: 0.9e1 }
    ]
  }
].each do |fnt|
  font = Font.find_or_create_by(name: fnt[:name])
  fnt[:dimensions].each do |dim|
    font.dimensions.joins(:quality).find_by(quality: { thesis: dim[:quality_thesis] }).update(value: dim[:value])
  end
end

[
  {
    name: "Verde Tono",
    value: "#007041",
    dimensions: [
      { quality_thesis: "Professional", value: 0.5e1 },
      { quality_thesis: "Fun", value: 0.8e1 },
      { quality_thesis: "Enthusiastic", value: 0.7e1 },
      { quality_thesis: "Upbeat", value: 0.8e1 },
      { quality_thesis: "Nostalgic", value: 0.6e1 }
    ]
  }
].each do |clr|
  color = Color.find_or_create_by(name: clr[:name], value: clr[:value])
  clr[:dimensions].each do |dim|
    color.dimensions.joins(:quality).find_by(quality: { thesis: dim[:quality_thesis] }).update(value: dim[:value])
  end
end
