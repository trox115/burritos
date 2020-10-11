require 'rails_helper'

RSpec.describe 'BurritosInfos', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get '/burritos_info/index'
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it 'returns http success' do
      get '/burritos_info/edit'
      expect(response).to have_http_status(:success)
    end
  end
end
