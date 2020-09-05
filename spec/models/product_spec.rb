require 'rails_helper'

RSpec.describe Product, type: :model do
  let(:valid_product) { Product.create(name: 'Simple Product') }
  let(:invalid_product) { Product.create(name: nil) }

  describe '#validations' do
    it { expect(valid_product).to be_valid }
    it { expect(invalid_product).not_to be_valid }
  end
end
