module ControllerSpecHelper
  def valid_home_attributes
    {
      home_type: 'Flat',
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
      has_air_con: true
    }
  end

  def invalid_home_attributes
    {
      home_type: nil,
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
      has_air_con: true
    }
  end
end
