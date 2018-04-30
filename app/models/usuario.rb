class Usuario < ApplicationRecord
  has_many  :depoimentos
  before_save { self.email = email.downcase }
  validates :nome, presence:true
  validates :idade, presence:true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence:true, length: {maximum: 255},
                    format: {with: VALID_EMAIL_REGEX}
  #has_secure_password
  validates :password, presence:true, length: {minimum: 6}
end
