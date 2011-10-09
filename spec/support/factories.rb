FactoryGirl.define do
  sequence :email do |n|
    "aa#{n}@domain.com"
  end

  sequence :name do |n|
    "aa#{n}"
  end

  factory :user do
    email
    name
    cpf 20401540871
    role "admin"
    shirt_size "P"
  end
end
