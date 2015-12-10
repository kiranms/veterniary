FactoryGirl.define do
  factory :user do
    name { Faker::Name.name }
    zip { Faker::Address.zip }
    email { Faker::Internet.email }
    password { Faker::Internet.password(8) }
    role { "customer" }
  end

  factory :doctor, parent: :user do
    role { "doctor" }
    years_in_practice { 5 }
  end
end