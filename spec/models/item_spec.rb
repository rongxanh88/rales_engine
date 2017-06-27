require 'rails_helper'

RSpec.describe Item, type: :model do
  describe 'valid attributes' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:unit_price) }
    it { should validate_presence_of(:merchant_id) }
  end

  describe 'relationships' do
    skip
  end
end
