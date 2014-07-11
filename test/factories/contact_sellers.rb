# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :contact_seller do
    name "MyString"
    email "MyString"
    mobile_number "MyString"
    message "MyText"
    user_id "MyText"
  end
end
