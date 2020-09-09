require 'rails_helper'

RSpec.describe Product, type: :model do
  let(:valid_product) { Product.create(name: 'Simple Product') }
  let(:invalid_product) { Product.create(name: nil) }

  describe '#validations' do
    it { expect(valid_product).to be_valid }
    it { expect(invalid_product).not_to be_valid }

    it 'is expected to be valid when sent 60 size name' do
      valid_product.name = Faker::Lorem.characters(number: 60)
      expect(valid_product).to be_valid
    end

    it 'is expected to be NOT valid when sent 61 size name' do
      invalid_product.name = Faker::Lorem.characters(number: 61)
      expect(invalid_product).not_to be_valid
    end

    it 'is expected to be NOT valid when duplicate name' do
      duplicated_record = valid_product.dup
      expect(duplicated_record).not_to be_valid
    end
  end

  describe '#associations' do
    it { should have_many(:opnions).class_name('Opnion') }
  end

  describe '#after_validations' do
    it '#set_slug convert name to downcase and change space to _' do
      expect(valid_product.slug).to be_eql('simple_product')
    end
  end

  describe '#methods' do
    it '#data_to_dashboard returns object' do
      Opnion.create(product: valid_product,
                    timestamp: Time.now.getutc,
                    rating: 10,
                    review_text: 'Review')

      expect(valid_product.data_to_dashboard[:count_opnions]).to be_eql(1)
      expect(valid_product.data_to_dashboard[:average_rating]).to be_eql(10.0)
      expect(valid_product.data_to_dashboard[:count_opnions_last_3_months]).to be_eql(1)
      expect(valid_product.data_to_dashboard[:average_rating_last_3_months]).to be_eql(10.0)
    end
  end
end
