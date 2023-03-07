# frozen_string_literal: true

# List Serializer
class ListSerializer
  # Short serializing
  class Short < ApplicationSerializer
    attributes :id, :title, :description, :created_at, :updated_at
  end

  # Detailed serializing
  class Detailed < Short
    has_many :items
  end
end
