FactoryGirl.define do

  factory :user do
    name 'Foo Bar'
    mobile '9999999999'
    email 'foo@bar.com'
    password 'password'
    college
  end

  factory :admin, class: User do
    name 'Bhushan Lodha'
    mobile '9975454384'
    email 'blo@alum.hackerschool.com'
    password 'password'

    admin true
  end

  factory :ankush, class: User do
    name 'Ankush Zanwar'
    mobile '9976543210'
    email 'ankush@gmail.com'
    password 'password'
    vit
  end

  factory :apurva, class: User do
    name 'Apurva Gayakwad'
    mobile '9967253719'
    email 'apurva@gmail.com'
    password 'password'
    viit
  end
end
