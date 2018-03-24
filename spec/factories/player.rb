FactoryBot.define do
    factory :player do
      first_name { Faker::Name.first_name }
      last_name { Faker::Name.last_name }
      position { "SF" }
      age { Faker::Number.between(1, 100) }
      sport_id { 1 }
    end
  end