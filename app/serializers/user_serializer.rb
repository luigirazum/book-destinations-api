# frozen_string_literal: true

class UserSerializer # rubocop:disable Style/Documentation
  include JSONAPI::Serializer
  attributes :username, :id, :email, :created_at
end
