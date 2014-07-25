# create colleges
3.times do
  College.create(name:  Faker::Company.name,
                 abbr:  Faker::Lorem.characters(3),
                 zipcode: Faker::Address.zip,
                 city:  Faker::Address.city)
end

# create users
5.times do
  User.create(name: Faker::Name.name,
              email:   Faker::Internet.email,
              password:    Faker::Internet.password,
              college:   College.all.sample,
              mobile_number: '9' + Faker::Number.number(9)
              )
end

5.times do
  Category.create(name: Faker::Commerce.department)
end


# create classifieds
30.times do
  Classified.create(
    title: Faker::Commerce.product_name,
    description: Faker::Lorem.paragraph,
    user: User.where(admin: false).sample,
    price: Faker::Commerce.price,
    category: Category.all.sample
  )
end
