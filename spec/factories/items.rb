FactoryGirl.define do
  factory :item do
    name        'Shovel'
    description 'New item made of sturdy materials.'
    unit_price  10
    association :merchant, factory: :merchant
  end
end
