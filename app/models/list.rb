# frozen_string_literal: true

# List Model
class List < ApplicationRecord
  validates :title, presence: true
end
