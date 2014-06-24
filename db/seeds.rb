image_path = "#{Rails.root}/test/fixtures"
book_images = [File.open("#{image_path}/book1.jpg"), File.open("#{image_path}/book2.jpg"),
		 	   File.open("#{image_path}/book3.jpg"), File.open("#{image_path}/book4.jpg"),
			   File.open("#{image_path}/book5.jpg"), File.open("#{image_path}/book6.jpg")]
profile_images = [File.open("#{image_path}/profile1.jpg"), File.open("#{image_path}/profile2.jpg"),
				  File.open("#{image_path}/profile3.jpg"), File.open("#{image_path}/profile4.jpg")]


#create colleges
2.times do
	College.create(name: 	Faker::Company.name,
							   abbr: 	Faker::Lorem.characters(3),
							   zipcode: Faker::Address.zip,
							   city: 	Faker::Address.city)
end

# creates an admin
foo = User.create(first_name: 'foo',
				  last_name:  'bar',
				  email: 	  'bhushanlodha@gmail.com',
	              password:   'password',
	              avatar: 	   File.open("#{Rails.root}/test/fixtures/test1.jpg"),
	              college: 	   College.all.sample
	              )

# create users
5.times do
  User.create(first_name: Faker::Name.first_name,
						 last_name:  Faker::Name.last_name,
						 email: 	 Faker::Internet.email,
						 password: 	 Faker::Internet.password,
						 college: 	 College.all.sample,
						 avatar: 	 profile_images.sample
						 )
end

# create classifieds
10.times do
	Classified.create(title: Faker::Lorem.words(1+rand(2)).join(' '),
					  description: Faker::Lorem.paragraph,
					  user: User.all.sample,
					  expected_price: Faker::Number.number(1+rand(2)),
					  retail_price: Faker::Number.number(1+rand(2)),
					  suggested_price: Faker::Number.number(1+rand(2)),
					  listing_type: [0, 1].sample,
					  list: [true, false].sample,
					  image: book_images.sample,
					  isbn: Faker::Code.isbn,
					  edition: 1+rand(3),
					  condition: [0, 1, 2].sample
					  )
end