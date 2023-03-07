# frozen_string_literal: true

# Item Serializer

class ItemSerializer
  # Short serializing
  class Short < ApplicationSerializer
    attributes :id, :description, :checked, :created_at, :updated_at
  end

  # Detailed serializing
  class Detailed < Short
    belongs_to :list
  end
end
