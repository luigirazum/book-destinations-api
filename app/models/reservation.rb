# frozen_string_literal: true

class Reservation < ApplicationRecord # rubocop:disable Style/Documentation
  belongs_to :user
  belongs_to :destination
end
