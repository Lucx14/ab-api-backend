# Seed some users
3.times do
  User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: 'password'
  )
end

# Seed data for Homes
2.times do
  User.last.listings.create(
    listing_type: 'Flat',
    short_description: 'Loft Room in E London in Family Home',
    long_description: 'This is a fantastic studio apartment offering bright, well presented accommodation. The property offers an abundance of light, stylish modern finish and various handy amenities, making it perfect for both tourists and business travellers.',
    total_occupancy: 1,
    total_bedrooms: 1,
    total_beds: 1,
    country: 'United Kingdom',
    city: 'London',
    street: 'Leighton Crescent',
    house_number: '22c',
    post_code: 'NW5 2QY',
    latitude: 51.552115,
    longitude: -0.134875,
    has_kitchen: true,
    has_wifi: true,
    has_tv: true,
    has_air_con: true,
    price_per_night: 32.53
  )
end
