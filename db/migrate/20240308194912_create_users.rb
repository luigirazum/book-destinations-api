# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[7.1] # rubocop:disable Style/Documentation
  def change
    create_table :users do |t|
      t.string :username

      t.timestamps
    end
  end
end
