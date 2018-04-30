class Usuario < ApplicationRecord
  has_many  :depoimentos
  validates :nome, presence:true
  validates :idade, presence:true
end
