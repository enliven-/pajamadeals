FactoryGirl.define do

  factory :user do
    name 'Foo Bar'
    mobile '9999999999'
    email 'foo@bar.com'
    password 'password'
    role :user
    college
  end

  factory :admin, class: User do
    name 'Bhushan Lodha'
    mobile '9975454384'
    email 'blo@alum.hackerschool.com'
    password 'password'
    role :admin
    
    college
  end
  
  factory :ambassador, class: User do
    name 'Bar'
    mobile '9999999992'
    email 'foo2@bar.com'
    password 'password'
    role :ambassador
    
    college
  end

  factory :ankush, class: User do
    name 'Ankush Zanwar'
    mobile '9976543210'
    email 'ankush@gmail.com'
    password 'password'
    role :user
    
    vit
  end

  factory :apurva, class: User do
    name 'Apurva Gayakwad'
    mobile '9967253719'
    email 'apurva@gmail.com'
    password 'password'
    role :user
    
    viit
  end
end
