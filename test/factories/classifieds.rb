FactoryGirl.define do
  factory :classified do
  	expected_price Faker::Number.number(3)
  	user
  	before(:create) { |classified| classified.send(:set_college) }

  	factory :sell do
  		listing_type { Classified::SELL }
	end

	factory :buy do
		listing_type { Classified::BUY }
	end

  end
end
