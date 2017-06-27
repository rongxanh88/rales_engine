require 'rails_helper'

RSpec.describe Transaction, type: :model do
  describe 'valid attributes' do
    it { should validate_presence_of(:credit_card_number) }
    it { should validate_presence_of(:result) }
  end

  describe 'relationships' do
    it { belong_to(:invoice) }
  end
end
