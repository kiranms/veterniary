FactoryGirl.define do
  factory :pet do
    name { Faker::Name.name }
    breed { Faker::Name.name }
    age { Faker::Number.number(1) }
    weight { Faker::Number.number(2) }
  end

  factory :dog, parent: :pet do
    pet_type { "dog" }
  end
end