require 'rails_helper'

RSpec.describe Merchant, type: :model do
  describe 'valid attributes' do
    it { should validate_presence_of(:name) }
  end

  describe 'relationships' do
    skip
  end
end