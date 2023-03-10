# frozen_string_literal: true

# User Serializer
class UserSerializer
  # Default serializing
  class Default < ApplicationSerializer
    attributes :id, :name, :email, :created_at, :updated_at
  end

  # Serializing with lists
  class WithLists < Default
    has_many :lists, serializer: ListSerializer::Default
  end
end
