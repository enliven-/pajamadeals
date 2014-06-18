FactoryGirl.define do
	factory :user do
		email 'foo@bar.com'
		password 'password'
		college

		factory :admin do
			admin true
		end
	end
end
