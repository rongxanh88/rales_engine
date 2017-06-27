FactoryGirl.define do
  factory :invoice do
<<<<<<< HEAD

=======
    association :merchant, factory: :merchant
    association :customer, factory: :customer
    
    status 'shipped'
>>>>>>> 99983b38687cfef3bc12e2e28b793562c4e229e0
  end
end
