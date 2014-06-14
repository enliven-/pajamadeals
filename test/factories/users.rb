FactoryGirl.define do
	factory :user do
		email Faker::Internet.email
		password Faker::Internet.password
		name Faker::Name.name
	end

	factory :ankush, class: User do
		email 'ankush@pajamadeals.in'
		password 'password'
		name 'Ankush Zanwar'
		association :college, factory: :vit
	end
end
