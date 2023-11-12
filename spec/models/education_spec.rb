require 'swagger_helper'

RSpec.describe 'api/education', type: :request do
  describe 'GET /api/education' do
    it 'returns all education' do
      expect(Education.count).to eq(0)
    end
  end
end
