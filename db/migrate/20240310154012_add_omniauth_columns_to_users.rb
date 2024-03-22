# frozen_string_literal: true

class AddOmniauthColumnsToUsers < ActiveRecord::Migration[7.1] # rubocop:disable Style/Documentation
  def change
    add_column :users, :provider, :string
    add_column :users, :uid, :string

    add_index :users, %i[provider uid], unique: true
  end
end
