require 'csv'

image_path = "#{Rails.root}/test/fixtures"
book_images = [File.open("#{image_path}/book1.jpg"), File.open("#{image_path}/book2.jpg"),
		 	   File.open("#{image_path}/book3.jpg"), File.open("#{image_path}/book4.jpg"),
			   File.open("#{image_path}/book5.jpg"), File.open("#{image_path}/book6.jpg")]
profile_images = [File.open("#{image_path}/profile1.jpg"), File.open("#{image_path}/profile2.jpg"),
				  File.open("#{image_path}/profile3.jpg"), File.open("#{image_path}/profile4.jpg")]


# create colleges
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

# Import CSV data for books
count = 1
CSV.foreach("#{Rails.root}/resources/books/books.csv", headers: true) do |row|
	if row[3] == 'Pune University'
		Book.create(
			title: 		 row[0].camelize,
			publisher: 	 row[1],
			author: 	 (row[2].split(',').map(&:camelize).join(',')),
			university:  row[3],
			department:  (row[4].camelize rescue ''),
			semester: 	 row[5],
			isbn: 		 row[6],
			# retail_price: row[7],
			image:       (File.open("#{Rails.root}/resources/books/#{row[8]}") rescue ''),
			edition: 	 row[9],
			pages: 		 row[10],
			description: row[11]	
			)
		count += 1
	end
	p Book.last
	break if count > 25
end

# create classifieds
30.times do
	Classified.create(
					  comment: Faker::Lorem.paragraph,
					  user: User.all.sample,
					  retail_price: Faker::Number.number(1+rand(2)),
					  expected_price: Faker::Number.number(1+rand(2)),
					  suggested_price: Faker::Number.number(1+rand(2)),
					  listing_type: [0, 1].sample,
					  active: [true, false].sample,
					  condition: ['used', 'heavily used', 'like new'].sample,
					  contact_preference: ['email', 'phone'].sample,
					  book: Book.all.sample
					  )
end





