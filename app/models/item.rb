# frozen_string_literal: true

# Item Model
class Item < ApplicationRecord
  belongs_to :list

  validates :description, presence: true
end
