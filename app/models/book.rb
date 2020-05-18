class Book < ApplicationRecord
  belongs_to :user, optional: true
  has_many :reservations
  mount_uploader :image, ImageUploader
  geocoded_by :address, latitude: :lat, longitude: :lon 
  after_validation :geocode


  def reserved_by?(user)
    reservations.where(user_id: user.id).exists?
  end
end
