class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :email, :avatar_url
  has_many :listings
  has_many :trips

  private

  def avatar_url
    object.avatar_url
  end
end
