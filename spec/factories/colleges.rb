FactoryGirl.define do
  factory :college do
    name 'Imperial Institute if Technology'
    abbr 'IIT'
    city 'Heaven'
    zipcode '111111'
  end

  factory :vit, class: College do
    name 'Vishwakarma Institute of Technology'
    abbr 'VIT'
    city 'Pune'
    zipcode '411037'
    latitude '18.464789'
    longitude '73.867767'
  end

  factory :viit, class: College do
    name 'Vishwakarma Institute of Information Technology'
    abbr 'VIIT'
    city 'Pune'
    zipcode '411048'
    latitude '18.460227'
    longitude '73.883645'
  end
  
  factory :mit, class: College do
    name 'Maharashtra Institude of Technology'
    abbr 'MIT'
    city 'Pune'
    zipcode '411038'
    latitude '18.512031'
    longitude '73.819770'
  end
end
