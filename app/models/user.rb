# frozen_string_literal: true

# User Model
class User < ApplicationRecord
  has_many :lists, dependent: :destroy

  has_secure_password

  validates :name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, length: { minimum: 8 }, if: -> { new_record? || !password.nil? }

  before_save { self.email = email.downcase }
end
