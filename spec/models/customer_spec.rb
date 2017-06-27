require 'rails_helper'

RSpec.describe Customer, type: :model do
  describe 'valid attributes' do
    it { should_validate_presence_of(:first_name) }
    it { should_validate_presence_of(:last_name) }
  end

  describe 'relationships' do

  end
end
