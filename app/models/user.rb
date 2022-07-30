# frozen_string_literal: true

class User < ApplicationRecord
  has_many :businesses, dependent: :destroy

  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  has_secure_password

  def self.create_passwordless(**params)
    create(**params.merge(password: SecureRandom.hex(16)))
  end
end
