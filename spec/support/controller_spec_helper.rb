module ControllerSpecHelper
  def valid_listing_attributes
    {
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
      price_per_night: 33.33
    }.to_json
  end

  def invalid_listing_attributes
    {
      listing_type: nil,
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
      price_per_night: 33.33
    }.to_json
  end

  def valid_reservation_attributes
    {
      checkin_date: Faker::Date.between(from: Date.today, to: 2.weeks.from_now),
      checkout_date: Faker::Date.between(from: 3.weeks.from_now, to: 4.weeks.from_now)
    }.to_json
  end

  # generate tokens from user id
  def token_generator(user_id)
    JsonWebToken.encode(user_id: user_id)
  end

  # generate expired token from user id
  def expired_token_generator(user_id)
    JsonWebToken.encode({ user_id: user_id }, (Time.now.to_i - 10))
  end

  # return valid headers
  def valid_headers
    {
      'Authorization' => token_generator(user.id),
      'Content-Type' => 'application/json'
    }
  end

  # return invalid headers
  def invalid_headers
    {
      'Authorization' => nil,
      'Content-Type' => 'application/json'
    }
  end

  def valid_guest_headers
    {
      'Authorization' => token_generator(guest.id),
      'Content-Type' => 'application/json'
    }
  end
end
