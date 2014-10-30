# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :order do
    buyer_id 1
    seller_id 1
    classified_id 1
    handler_id 1
    college_id 1
    status 1
  end
end
