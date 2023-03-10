# frozen_string_literal: true

# Modify Lists Migration
class ModifyLists < ActiveRecord::Migration[7.0]
  def change
    change_table :lists do |t|
      t.belongs_to :user, foreign_key: true
    end
  end
end
