# frozen_string_literal: true

class Books < ActiveRecord::Migration[5.0]
  def change
    create_table :books do |t|
      t.integer :user_id, foreign_key: true
      t.string :title, null: false, default: ''
      t.string :image
      t.text :text
      t.datetime :published_at, null: false
      t.date :end_day, null: false
      t.timestamps
    end
  end
end
