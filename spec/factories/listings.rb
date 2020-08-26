FactoryBot.define do
  factory :listing do
    listing_type { Faker::Lorem.word }
    short_description { Faker::Lorem.sentence(word_count: 8) }
    long_description { Faker::Lorem.sentence(word_count: 20) }
    total_occupancy { Faker::Number.within(range: 1..10) }
    total_bedrooms { Faker::Number.within(range: 1..10) }
    total_beds { Faker::Number.within(range: 1..10) }
    country { Faker::Address.country }
    city { Faker::Address.city }
    street { Faker::Address.street_name }
    house_number { Faker::Address.building_number }
    post_code { Faker::Address.postcode }
    latitude { Faker::Address.latitude }
    longitude { Faker::Address.longitude }
    has_kitchen { Faker::Boolean.boolean }
    has_wifi { Faker::Boolean.boolean }
    has_tv { Faker::Boolean.boolean }
    has_air_con { Faker::Boolean.boolean }
  end
end
