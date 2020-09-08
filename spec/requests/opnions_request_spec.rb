require 'rails_helper'

RSpec.describe 'Opnions', type: :request do
  describe 'POST /opnion' do
    it 'returns http unprocessable_entity' do
      post '/opnion', params: {}
      expect(response).to have_http_status(:unprocessable_entity)
    end

    it 'returns http ok' do
      post '/opnion', params: {
        product: 'Lorem Product',
        timestamp: 8792634,
        rating: 7,
        review_text: 'Lorem Ipsum'
      }
      expect(response).to have_http_status(:ok)
    end
  end
end
