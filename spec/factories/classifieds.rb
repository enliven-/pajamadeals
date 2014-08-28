FactoryGirl.define do
  factory :classified do
    title 'Sell something man'
    description 'Lorem ipsum dallar sit mat'
    price '300'
    category
    user
    
    factory :buy_classified do
      listing_type :buy
    end
    
    factory :sell_classified do
      listing_type :sell
    end
  end
end
