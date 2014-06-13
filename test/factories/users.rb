FactoryGirl.define do
	factory :ankush, class: User do
		email 'ankush@pajamadeals.in'
		password 'password'
		name 'Ankush Zanwar'
		association :college, factory: :vit
	end
end
