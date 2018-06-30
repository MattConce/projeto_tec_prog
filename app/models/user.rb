class User < ApplicationRecord
  #attr_accessor :password, :password_confirmation

  validates :password, presence:{ on: :create }, length: {minimum: 6}
  validates :name, presence:true, length: {maximum:50}
  VALID_EMAIL = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence:true, length: {maximum:255},
                    format: {with: VALID_EMAIL},
                    uniqueness: { case_sensitive: false }

  has_secure_password
  has_many :posts, dependent: :destroy
  has_one :register, dependent: :destroy

  mount_uploader :image, ImageUploader

  # before_save { self.email = email.downcase }
  before_save { email.downcase! }
end
