require 'rails_helper'

RSpec.describe Opnion, type: :model do
  let(:product) { Product.create(name: 'Product 1') }
  let(:valid_opnion) { Opnion.create(timestamp: 123, rating: 1, review_text: Faker::Lorem.sentence, product: product) }
  let(:invalid_opnion) { Opnion.create(timestamp: nil, rating: nil, review_text: nil, product: nil) }

  describe '#validations' do
    it { expect(valid_opnion).to be_valid }
    it { expect(invalid_opnion).not_to be_valid }

    it { should validate_presence_of(:timestamp) }
    it { should validate_presence_of(:rating) }
    it { should validate_presence_of(:review_text) }
    it { should validate_presence_of(:product) }
  end

  describe '#associations' do
    it { should belong_to(:product).class_name('Product') }
  end
end
