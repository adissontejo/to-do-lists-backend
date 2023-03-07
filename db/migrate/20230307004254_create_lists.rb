# frozen_string_literal: true

# Create Lists Migration
class CreateLists < ActiveRecord::Migration[7.0]
  def change
    create_table :lists do |t|
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
