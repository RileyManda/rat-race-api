require 'swagger_helper'

RSpec.describe 'api/profiles', type: :request do
  describe 'GET /api/profiles' do
    it 'returns all profiles' do
      expect(Profile.count).to eq(0)
    end
  end
end
