# frozen_string_literal: true

# Item Serializer

class ItemSerializer
  # Default serializing
  class Default < ApplicationSerializer
    attributes :id, :description, :checked, :created_at, :updated_at
  end

  # Serializing with list
  class WithList < Default
    belongs_to :list, serializer: ListSerializer::Default
  end
end
