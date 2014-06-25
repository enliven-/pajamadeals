# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :book do
    title "MyString"
    description "MyText"
    publisher "MyString"
    author "MyString"
    isbn "MyString"
    edition "MyString"
    released_year "MyString"
    retail_price "MyString"
    university "MyString"
  end
end
