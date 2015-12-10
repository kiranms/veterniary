FactoryGirl.define do
  factory :appointment do
    date_of_visit { Time.now + 2.days }
  end
end