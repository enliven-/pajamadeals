FactoryGirl.define do
	factory :user do
		email 'foo@bar.com'
		password 'password'
	end

	factory :ankush, class: User do
		email 'ankush@pajamadeals.in'
		password 'password'
		first_name 'Ankush'
		last_name 'Zanwar'
		association :college, factory: :vit
	end
end
