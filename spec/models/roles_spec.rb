require 'swagger_helper'

RSpec.describe 'api/roles', type: :request do
  describe 'with roles' do
    it 'returns all roles' do
      expect(Role.count).to eq(0)
    end
  end
end
