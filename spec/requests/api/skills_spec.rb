require 'swagger_helper'

RSpec.describe 'api/skills', type: :request do
  describe 'GET /api/skills' do
    it 'returns all skills' do
      expect(Skill.count).to eq(0)
    end
  end
end
