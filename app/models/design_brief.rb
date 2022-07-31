class DesignBrief < ApplicationRecord
  belongs_to :business

  store :histograms, accessors: [:colors, :fonts, :sentiment]
end
