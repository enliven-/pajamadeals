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
  end

  factory :viit, class: College do
    name 'Vishwakarma Institute of Information Technology'
    abbr 'VIIT'
    city 'Pune'
    zipcode '411048'
  end
end
