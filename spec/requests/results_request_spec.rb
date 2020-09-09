require 'rails_helper'

RSpec.describe 'Results', type: :request do
  describe 'GET #show' do
    it 'returns http success' do
      pro = Product.create(name: 'Name Test')
      pro.opnions.create(timestamp: 123, rating: 1, review_text: Faker::Lorem.sentence)

      get '/results/Name_Test'
      expect(response).to have_http_status(:success)
    end

    it 'returns http not_found' do
      get '/results/not_found_product'
      expect(response).to have_http_status(:not_found)
    end
  end
end
