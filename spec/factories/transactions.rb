FactoryGirl.define do
  factory :transaction do
    association :invoice, factory: :invoice
    credit_card_number 1234123412341234
    result 'success'
  end
end
