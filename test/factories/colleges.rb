FactoryGirl.define do
	factory :college do
		name Faker::Company.name
		abbr Faker::Lorem.characters(3)
		city Faker::Address.city
		state Faker::Address.state
		country Faker::Address.country
		address Faker::Address.street_address
		zip_code Faker::Address.zip_code
	end

	factory :vit, class: College do
		name 'Vishwakarma Institute of Technology'
		abbr 'VIT'
		city 'Pune'
		state 'Maharashtra'
		country 'India'
		address '666, Upper Indiranagar'
		zip_code '411048'
	end
end
