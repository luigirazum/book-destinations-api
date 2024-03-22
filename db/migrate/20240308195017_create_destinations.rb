# frozen_string_literal: true

class CreateDestinations < ActiveRecord::Migration[7.1] # rubocop:disable Style/Documentation
  def change
    create_table :destinations do |t|
      t.string :name
      t.string :image_url
      t.text :description
      t.decimal :price_per_night
      t.decimal :price_per_meal

      t.timestamps
    end
  end
end
