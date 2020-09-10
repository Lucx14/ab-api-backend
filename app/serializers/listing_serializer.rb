class ListingSerializer < ActiveModel::Serializer
  attributes :id, :images, :listing_type, :short_description, :long_description,
             :total_occupancy, :total_bedrooms, :total_beds,
             :country, :city, :street, :house_number, :post_code,
             :latitude, :longitude, :has_kitchen, :has_wifi, :has_tv,
             :has_air_con, :price_per_night, :host_details,
             :reviews, :unavailable_dates

  def images
    object.image_urls
  end

  def host_details
    {
      host_id: object.host.id,
      host_name: "#{object.host.first_name} #{object.host.last_name}",
      host_email: object.host.email,
      host_avatar: (object.host.avatar_url || nil)
    }
  end

  def unavailable_dates
    object.unavailable_dates
  end

  def reviews
    object.reviews.map do |review|
      {
        review_id: review.id,
        rating: review.rating,
        description: review.description,
        guest: { name: "#{review.guest.first_name} #{review.guest.last_name}",
                 email: review.guest.email,
                 reviewed_on: review.created_at.to_date }
      }
    end
  end
end
