FactoryGirl.define do
	factory :college do
		name Faker::Company.name
		abbr Faker::Lorem.characters(3)
		location Faker::Address.city
		zip_code Faker::Address.zip_code
	end

	factory :vit, class: College do
		name 'Vishwakarma Institute of Technology'
		abbr 'VIT'
		location 'Pune'
		zip_code '411048'
	end
end
