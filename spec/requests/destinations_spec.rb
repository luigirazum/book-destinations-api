# frozen_string_literal: true

# spec/requests/destinations_spec.rb

require 'rails_helper'

RSpec.describe 'Destinations API', type: :request do # rubocop:disable Metrics/BlockLength
  # Create a test data setup before each test
  before(:each) do
    FactoryBot.create_list(:destination, 10)
    @token = token
  end

  describe 'GET /api/v1/destinations' do
    it 'returns a list of posts' do
      get '/api/v1/destinations', headers: { 'Authorization' => @token }
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body).length).to eq(10)
    end
  end

  describe 'GET /api/v1/destinations/id' do
    it 'returns a first destination' do
      get '/api/v1/destinations/', headers: { 'Authorization' => @token }
      first = JSON.parse(response.body)[0]
      id = JSON.parse(response.body)[0]['id']
      get "/api/v1/destinations/#{id}", headers: { 'Authorization' => @token }
      result = JSON.parse(response.body)
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body)['id']).to eq(id)
      expect(result).to eq(first)
    end
  end

  private

  def token
    user_params = {
      user: {
        username: 'testuser',
        email: 'testuser@example.com',
        password: 'password'
      }
    }

    post '/signup', params: user_params.to_json, headers: { 'Content-Type' => 'application/json' }
    post '/login', params: user_params.to_json, headers: { 'Content-Type' => 'application/json' }

    response.headers['authorization']
  end
end
