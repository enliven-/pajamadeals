# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
3.times do |n|
c1 = Classified.create(title: "Engineering mathematics #{n} for sale", 
			   description: 'excellent condition engineering book for sale',
		       college_id: 1,
		       image: 'foo',
		       expected_price: '200',
		       listing_type: 1,
		       list: true,
		       isbn: '123',
		       user_id: 3,
		       )
end

c2 = Classified.create(title: "Physics from nirali engineer",
	description: 'this is an excellent book',
		       college_id: 1,
		       image: 'foo',
		       expected_price: '200',
		       listing_type: 1,
		       list: true,
		       isbn: '123',
		       user_id: 3,
		       )
