# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :pick do
    message "MyText"
    picked false
    delivered false
    picked_at "2014-06-28 11:24:06"
    delivered_at "2014-06-28 11:24:06"
  end
end
