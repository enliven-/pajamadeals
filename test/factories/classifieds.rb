ActionDispatch::TestProcess

FactoryGirl.define do		
  factory :buy, class: Classified do
	  title Faker::Lorem.sentence(4)
	  description Faker::Lorem.paragraph
	  price Faker::Number.number(3)
	  listing_type { Classified::BUY }
	  association :user, factory: :ankush
	  before(:create) { |classified| classified.send(:set_college) }
  end

  factory :sell, class: Classified do
	  title Faker::Lorem.sentence(4)
	  description Faker::Lorem.paragraph
	  price Faker::Number.number(2)
	  listing_type { Classified::SELL }
	  association :user, factory: :ankush
	  before(:create) { |classified| classified.send(:set_college) }
  end
end
