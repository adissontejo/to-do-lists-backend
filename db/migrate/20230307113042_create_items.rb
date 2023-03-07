# frozen_string_literal: true

# Create Items Migration
class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.belongs_to :list, foreign_key: true
      t.text :description
      t.boolean :checked

      t.timestamps
    end
  end
end
