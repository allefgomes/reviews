require 'rails_helper'

RSpec.describe 'Results', type: :request do
  describe 'GET #show' do
    let!(:product) { Product.create!(name: 'Name Test') }

    before(:each) { product.save }

    it 'returns http success' do
      get '/results/Name%20Test'
      expect(response).to have_http_status(:success)
    end
  end
end
