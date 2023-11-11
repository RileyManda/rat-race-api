require 'swagger_helper'

RSpec.describe 'api/companies', type: :request do
  describe 'GET /api/companies' do
    it 'returns all companies' do
      get '/api/companies'
      expect(response).to have_http_status(:success)
    end
  end
end
