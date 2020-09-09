require 'rails_helper'

RSpec.describe ResultsHelper, type: :helper do
  describe 'test decimal round' do
    it { expect(helper.decimal_round(1)).to eql(1.0) }
    it { expect(helper.decimal_round(nil)).to eql(0) }
    it { expect(helper.decimal_round(8.0)).to eql(8.0) }
  end
end
