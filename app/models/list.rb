# frozen_string_literal: true

# List Model
class List < ApplicationRecord
  belongs_to :user
  has_many :items, dependent: :destroy

  validates :title, presence: true
end
