# frozen_string_literal: true

class Business < ApplicationRecord
  include Vectorizable
  belongs_to :user, optional: true
  belongs_to :industry, optional: true
  has_many :dimensions, as: :dimensionable, dependent: :destroy
  has_many :competitors, dependent: :destroy

  validates :name, presence: true

  def self.autogenerate
    create(name: "Auto-generated #{SecureRandom.uuid}")
  end
end
