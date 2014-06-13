# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :buy, class: Classified do
	  title Faker::Lorem.sentence(4)
	  description Faker::Lorem.paragraph
	  price Faker::Number.number(3)
	  type { Classified::BUY }
	  association :user, factory: :ankush
  end

  factory :sell, class: Classified do
	  title Faker::Lorem.sentence(4)
	  description Faker::Lorem.paragraph
	  price Faker::Number.number(2)
	  type { Classified::SELL }
	  association :user, factory: :ankush
  end
end
