require 'rails_helper'

RSpec.describe 'Results', type: :request do
  describe 'GET #show' do
    it 'returns http success' do
      pro = Product.create(name: 'Name Test')
      pro.opnions.create(timestamp: 123, rating: 1, review_text: Faker::Lorem.sentence)

      get '/results/Name%20Test'
      expect(response).to have_http_status(:success)
    end
  end
end
