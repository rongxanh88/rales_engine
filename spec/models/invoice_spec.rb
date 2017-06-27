require 'rails_helper'

RSpec.describe Invoice, type: :model do
  describe 'valid attributes' do
    it { should validate_presence_of(:status) }
    it { should validate_presence_of(:merchant_id) }
    it { should validate_presence_of(:customer_id) }
  end

  describe 'relationships' do
    it { belong_to(:customer) }
    it { belong_to(:merchant) }
    it { have_many(:invoice_items) }
    it { have_many(:transactions) }
  end
end
