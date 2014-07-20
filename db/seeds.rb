require 'csv'

# image_path = "#{Rails.root}/test/fixtures"
# book_images = [File.open("#{image_path}/book1.jpg"), File.open("#{image_path}/book2.jpg"),
#                File.open("#{image_path}/book3.jpg"), File.open("#{image_path}/book4.jpg"),
#                File.open("#{image_path}/book5.jpg"), File.open("#{image_path}/book6.jpg")]
# profile_images = [File.open("#{image_path}/profile1.jpg"), File.open("#{image_path}/profile2.jpg"),
#                   File.open("#{image_path}/profile3.jpg"), File.open("#{image_path}/profile4.jpg")]


# # create colleges
# 2.times do
#   College.create(name:  Faker::Company.name,
#                  abbr:  Faker::Lorem.characters(3),
#                  zipcode: Faker::Address.zip,
#                  city:  Faker::Address.city)
# end

# # creates an admin
# foo = User.create(name: 'foo bar',
#                   email:    'bhushanlodha@gmail.com',
#                   password:   'password',
#                   avatar:      File.open("#{Rails.root}/test/fixtures/test1.jpg"),
#                   college:     College.all.sample,
#                   mobile_number: '9975454384'
#                   )

# # create users
# 5.times do
#   User.create(name: Faker::Name.name,
#               email:   Faker::Internet.email,
#               password:    Faker::Internet.password,
#               college:   College.all.sample,
#               avatar:    profile_images.sample,
#               mobile_number: '9' + Faker::Number.number(9)
#               )
# end

# Import CSV data for books
count = 1
CSV.foreach("#{Rails.root}/resources/books/books.csv", headers: true) do |row|
  p count
  if row[3] == 'Pune University'
    Book.create(
      title:     row[0].camelize,
      publisher:   row[1],
      author:    (row[2].split(',').map(&:camelize).join(',')),
      university:  row[3],
      department:  (row[4].camelize rescue ''),
      semester:    row[5],
      isbn:      row[6],
      image:       (File.open("#{Rails.root}/resources/books/#{row[8]}") rescue ''),
      edition:   row[9],
      pages:     row[10],
      description: row[11]
    )
    count += 1
  end
end

# # create classifieds
# 30.times do
#   Classified.create(
#     comment: Faker::Lorem.paragraph,
#     user: User.all.sample,
#     retail_price: Faker::Number.number(1+rand(2)),
#     expected_price: Faker::Number.number(1+rand(2)),
#     listing_type: [0, 1].sample,
#     active: [true, false].sample,
#     book: Book.all.sample
#   )
# end
