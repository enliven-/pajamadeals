# #create colleges
# 3.times do
#   College.create(name:  Faker::Company.name,
#                  abbr:  Faker::Lorem.characters(3),
#                  zipcode: Faker::Address.zip,
#                  city:  Faker::Address.city)
# end
#
# # create users
# 5.times do
#   User.create(name: Faker::Name.name,
#               email:   Faker::Internet.email,
#               password:    Faker::Internet.password,
#               college:   College.all.sample,
#               mobile: '9' + Faker::Number.number(9)
#               )
# end
#
# 5.times do
#   Category.create(name: Faker::Commerce.department)
# end
#
#
# # create classifieds
# 35.times do
#   Classified.create(
#     title: Faker::Commerce.product_name,
#     description: Faker::Lorem.paragraph,
#     user: User.where(admin: false).sample,
#     price: Faker::Commerce.price.ceil,
#     category: Category.all.sample
#   )
# end

require 'rubygems'
require 'csv'
require 'faker'

rows = []
users = []
CSV.foreach("#{Rails.root}/db/books.csv") do |row|
  rows << row
end

methods = [:capitalize, :downcase, :upcase]

# viit
20.times do
  users << User.create(mobile: '9' + Faker::Number.number(9),
                       college: College.find(2),
                       name: 'foo bar',
                       college: College.all.sample,
                       fake: true
                       )
end

32.times do |n|
  p n
  row = rows.sample
  Classified.create(
                    listing_type: [:sell, :buy].sample,
                    title: row[1].send(methods.sample),
                    description: "#{row[4]}, #{row[3]} publication",
                    category_id: 1,
                    price: row[8],
                    user: users.sample,
                    fake: true,
                    created_at: (Date.today - rand(9).days)
                   )
end

# 54.times do |n|
#   p n
#   Classified.create(
#                     listing_type: :sell,
#                     title: ['Drafer', 'drafter', 'omega drafter', 'mini drafter', 'apron', 'boiler suit'].sample,
#                     category_id: 6,
#                     price: [80, 100, 120].sample,
#                     user: users.sample,
#                     fake: true,
#                     created_at: (Date.today - rand(35).days)
#                    )
# end
#
# # mit
#
# 78.times do
#   users << User.create(mobile: '9' + Faker::Number.number(9),
#                        college: College.find(4),
#                        name: 'foo bar',
#                        fake: true
#                        )
# end
#
# 97.times do |n|
#   p n
#   row = rows.sample
#   Classified.create(
#                     listing_type: [:sell, :buy].sample,
#                     title: row[1].send(methods.sample),
#                     description: "#{row[4]}, #{row[3]} publication",
#                     category_id: 1,
#                     price: row[8],
#                     user: users.sample,
#                     fake: true,
#                     created_at: (Date.today - rand(22).days)
#                    )
# end
#
# 31.times do |n|
#   p n
#   Classified.create(
#                     listing_type: :sell,
#                     title: ['Drafer', 'drafter', 'omega drafter', 'mini drafter', 'apron', 'boiler suit'].sample,
#                     category_id: 6,
#                     price: [80, 100, 120].sample,
#                     user: users.sample,
#                     fake: true,
#                     created_at: (Date.today - rand(22).days)
#                    )
# end
#
# # ndmvp
#
# 80.times do
#   users << User.create(mobile: '9' + Faker::Number.number(9),
#                        college: College.find(3),
#                        name: 'foo bar',
#                        fake: true
#                        )
# end
#
# 103.times do |n|
#   p n
#   row = rows.sample
#   Classified.create(
#                     listing_type: [:sell, :buy].sample,
#                     title: row[1].send(methods.sample),
#                     description: "#{row[4]}, #{row[3]} publication",
#                     category_id: 1,
#                     price: row[8],
#                     user: users.sample,
#                     fake: true,
#                     created_at: (Date.today - rand(23).days)
#                    )
# end
#
# 40.times do |n|
#   p n
#   Classified.create(
#                     listing_type: :sell,
#                     title: ['Drafer', 'drafter', 'omega drafter', 'mini drafter', 'apron', 'boiler suit'].sample,
#                     category_id: 6,
#                     price: [80, 100, 120].sample,
#                     user: users.sample,
#                     fake: true,
#                     created_at: (Date.today - rand(23).days)
#                    )
# end
#
#
#
