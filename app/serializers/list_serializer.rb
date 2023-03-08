# frozen_string_literal: true

# List Serializer
class ListSerializer
  # Short serializing
  class Short < ApplicationSerializer
    attributes :id, :title, :description, :created_at, :updated_at, :done_items, :total_items

    def done_items
      object.items.where(checked: true).count
    end

    def total_items
      object.items.all.count
    end
  end

  # Detailed serializing
  class Detailed < Short
    has_many :items
  end
end
