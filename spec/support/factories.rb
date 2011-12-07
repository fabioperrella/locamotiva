FactoryGirl.define do
  sequence :email do |n|
    "aa#{n}@locaweb.com.br"
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
    password "inicial1234"
  end

  factory :race do
    name "lala"
    date Time.now
    confirmed { true }
  end

  factory :subscription do
    race { FactoryGirl.create(:race) }
    user { FactoryGirl.create(:user) }
    shirt_size "P"
  end
end
