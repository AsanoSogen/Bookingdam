class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable

  VALID_EMAIL_REGEX =  /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-zA-Z])(?=.*?\d)[a-zA-Z\d!@#\$%\^\&*\)\(+=._-]{7,128}\z/i

  # step1入力項目

  validates :nickname,       presence: true, length: {maximum: 15}
  validates :email,          presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
  validates :password,       presence: true, length: {minimum: 7, maximum: 128}, format: { with: VALID_PASSWORD_REGEX, message: 'は英字と数字両方を含むパスワードを設定してください'}
  validates :password_confirmation, presence: true, length: {minimum: 7, maximum: 128}, format: { with: VALID_PASSWORD_REGEX, message: 'は英字と数字両方を含むパスワードを設定してください'}
  mount_uploader :image, ImageUploader
  has_one :address
  accepts_nested_attributes_for :address
  has_many :books
  has_many :reservations, dependent: :destroy
  has_many :reservation_books, through: :reservations, source: :book
end