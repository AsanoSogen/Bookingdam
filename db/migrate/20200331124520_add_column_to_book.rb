# frozen_string_literal: true

class AddColumnToBook < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :address, :string
    add_column :books, :latitude, :float
    add_column :books, :longitude, :float
  end
end
