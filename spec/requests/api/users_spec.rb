require 'swagger_helper'

RSpec.describe 'api/users', type: :request do
  describe 'GET /api/users' do
    it 'returns all users' do
      get '/api/users'
      expect(response).to have_http_status(:success)
    end
  end
end
