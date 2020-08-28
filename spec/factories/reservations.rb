FactoryBot.define do
  factory :reservation do
    checkin_date { Faker::Date.between(from: Date.today, to: 2.weeks.from_now) }
    checkout_date { Faker::Date.between(from: 3.weeks.from_now, to: 4.weeks.from_now) }
  end
end
