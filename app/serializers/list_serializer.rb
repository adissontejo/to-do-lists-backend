# frozen_string_literal: true

# List Serializer
class ListSerializer
  # Default serializing
  class Default < ApplicationSerializer
    attributes :id, :title, :description, :created_at, :updated_at, :done_items, :total_items

    def done_items
      object.items.where(checked: true).count
    end

    def total_items
      object.items.all.count
    end
  end

  # Serializing with items
  class WithItems < Default
    has_many :items, serializer: ItemSerializer::Default
  end
end
