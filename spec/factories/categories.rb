# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :category do
    name 'category'
  end

  factory :books, class: Category do
    name 'Books'
  end

  factory :mobiles, class: Category do
    name 'Mobiles'
  end

  factory :projects, class: Category do
    name 'Projects'
  end
end
