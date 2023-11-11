require 'swagger_helper'

RSpec.describe 'api/job_applications', type: :request do
  describe 'GET /api/job_applications' do
    it 'returns all job_applications' do
      expect(JobApplication.count).to eq(0)
    end
  end
end
