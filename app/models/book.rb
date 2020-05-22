class Book < ApplicationRecord


  validates :title,             presence: true,length: {maximum: 20}
  validates :text,              presence: true,length: {maximum: 250}
  validates :image,             presence: true
  validates :published_at,      presence: true
  validates :end_day,           presence: true
  validates :address,           presence: true
  validates :latitude,          presence: true
  validates :longitude,         presence: true



  belongs_to :user, optional: true
  has_many :reservations
  has_many :reservation_users, through: :reservations, source: :user
  mount_uploader :image, ImageUploader
  geocoded_by :address, latitude: :lat, longitude: :lon 
  after_validation :geocode


  def reserved_by?(user)
    reservations.where(user_id: user.id).exists?
  end
end
