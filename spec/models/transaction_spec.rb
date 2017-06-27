require 'rails_helper'

RSpec.describe Transaction, type: :model do
  describe 'valid attributes' do
    it { should_validate_presence_of(:credit_card_number) }
    it { should_validate_presence_of(:result) }
  end

  describe 'relationships' do
    it 'belongs to invoice' do
      transaction = create(:transaction)

      expect(transaction).to respond_to(Invoice)
    end
  end
end
