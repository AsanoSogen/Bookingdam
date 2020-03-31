class Book < ApplicationRecord
  belongs_to :user, optional: true
  has_many :reservations
  mount_uploader :image, ImageUploader
  
end
